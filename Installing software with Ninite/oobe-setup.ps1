# ============================================================================
# Script: oobe-setup.ps1
# Função: Preparar provisionamento de software via Ninite
# Dependências: Nenhuma (utiliza cmdlets nativos do PowerShell)
# Descrição:
#   - Cria conta de administrador local
#   - Cria pasta C:\ProgramData\provisioning
#   - Copia arquivos do pacote (exceto oobe-*) para provisionamento
#   - Configura RunOnce para executar desktop-provisioning.ps1
#   - Desabilita Experiência de Privacidade
# ============================================================================

# Create local admin account
# Cria conta de administrador local sem senha
$local_user = @{
    Name       = 'admin'
    NoPassword = $true
}

$user = New-LocalUser @local_user 
$user | Set-LocalUser -PasswordNeverExpires $true 
$user | Add-LocalGroupMember -Group "Administrators"

# Create C:\ProgramData\provisioning directory
# Cria o diretório de provisionamento
$provisioning = ni "$($env:ProgramData)\provisioning" -ItemType Directory -Force

# Move files from provisioning package to provisioning folder
# Move arquivos (exceto oobe-*) para a pasta de provisionamento
gci -File | ? { $_.Name -notlike "oobe-*" } | % {
    cp $_.FullName "$($provisioning.FullName)\$($_.Name)" -Force
}

# Configura registro para executar desktop-provisioning.ps1 e desabilitar privacidade
$settings =
[PSCustomObject]@{ # Execute desktop-provisioning.ps1
    Path  = "SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
    Name  = "execute_provisioning"
    Value = "cmd /c powershell.exe -ExecutionPolicy Bypass -File {0}\desktop-provisioning.ps1 -ProvisioningFolder {0}" -f $provisioning.FullName
},
[PSCustomObject]@{ # Disable privacy experiance
    Path  = "SOFTWARE\Policies\Microsoft\Windows\OOBE"
    Name  = "DisablePrivacyExperience"
    Value = 1
} | group Path

foreach ($setting in $settings) {
    $registry = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey($setting.Name, $true)
    if ($null -eq $registry) {
        $registry = [Microsoft.Win32.Registry]::LocalMachine.CreateSubKey($setting.Name, $true)
    }
    $setting.Group | % {
        $registry.SetValue($_.name, $_.value)
    }
    $registry.Dispose()
}
