# ============================================================================
# Script: oobe-setup.ps1
# Função: Preparar ambiente de provisionamento durante o OOBE
# Dependências: Nenhuma (utiliza cmdlets nativos do PowerShell)
# Descrição:
#   - Cria diretório C:\ProgramData\provisioning
#   - Copia arquivos do pacote de provisionamento (exceto oobe-*)
#   - Configura RunOnce para executar desktop-provisioning.ps1 no primeiro logon
#   - Desabilita animação de primeiro logon
# ============================================================================

# Create C:\ProgramData\provisioning directory
# Cria o diretório para armazenar os arquivos de provisionamento
$provisioning = ni "$($env:ProgramData)\provisioning" -ItemType Directory -Force

# Move files from provisioning package to provisioning folder
# Copia todos os arquivos (exceto os que começam com oobe-) para a pasta de provisionamento
gci -File | ? { $_.Name -notlike "oobe-*" } | % {
    cp $_.FullName "$($provisioning.FullName)\$($_.Name)" -Force
}

# Configurações do registro para executar scripts e desabilitar animações
$registry_settings =
[PSCustomObject]@{ # Execute desktop-provisioning.ps1 using RunOnce
    Path  = "SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
    Name  = "execute_desktop_provisioning"
    Value = "cmd /c powershell.exe -ExecutionPolicy Bypass -File $($provisioning.FullName)\desktop-provisioning.ps1 -provisioning $($provisioning)"
},
[PSCustomObject]@{ # Disable first logon animation
    Path  = "Software\Microsoft\Windows\CurrentVersion\Policies\System"
    Name  = "EnableFirstLogonAnimation"
    Value = 0
}

# Apply registry settings
# Aplica as configurações no registro do Windows (HKLM)
foreach ($setting in ($registry_settings | group Path)) {
    $registry = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey($setting.Name, $true)
    if ($null -eq $registry) {
        $registry = [Microsoft.Win32.Registry]::LocalMachine.CreateSubKey($setting.Name, $true)
    }
    $setting.Group | % {
        if (!$_.Type) {
            $registry.SetValue($_.name, $_.value)
        }
        else {
            $registry.SetValue($_.name, $_.value, $_.type)
        }
    }
    $registry.Dispose()
}