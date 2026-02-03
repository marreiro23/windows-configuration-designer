# ============================================================================
# Script: oobe-setup.ps1
# Função: Configuração OOBE com definições regionais
# Dependências: oobe-regional.ps1 (no mesmo diretório)
# Descrição:
#   - Executa configurações regionais (via oobe-regional.ps1)
#   - Cria pasta de provisionamento
#   - Cria conta admin local
#   - Desabilita Experiência de Privacidade
#   - Configura RunOnce para desktop-provisioning.ps1
#   - Desabilita suspensão/hibernação
# ============================================================================

# Execute oobe scripts
# Executa o script de configuração regional (Húngaro neste caso)
. .\oobe-regional.ps1

# prepare provisioning folder
# Prepara a pasta C:\ProgramData\provisioning
$provisioning = ni "$($env:ProgramData)\provisioning" -ItemType Directory -Force

# move files from provisioning package to provisioning folder
# Copia arquivos (exceto oobe_*) para a pasta de provisionamento
gci -File | ? { $_.Name -notlike "oobe_*" } | % {
    cp $_.FullName "$($provisioning.FullName)\$($_.Name)" -Force
}

# Create local admin account
# Cria conta de administrador local sem senha
$local_user = @{
    Name                 = 'admin'
    NoPassword           = $true
}
$user = New-LocalUser @local_user 
$user | Set-LocalUser -PasswordNeverExpires $true 
$user | Add-LocalGroupMember -Group "Administrators"

# Skip "Privacy Experiance" and configure RunOnce
# Desabilita tela de privacidade e configura execução no próximo logon
$settings =
[PSCustomObject]@{
    Path  = "SOFTWARE\Policies\Microsoft\Windows\OOBE"
    Name  = "DisablePrivacyExperience"
    Value = 1
},
[PSCustomObject]@{
    Path  = "SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
    Name  = "execute_provisioning"
    Value = "cmd /c powershell.exe -ExecutionPolicy Bypass -File {0}\desktop-provisioning.ps1" -f $provisioning.FullName
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

# Configure power settings
# Disable sleep, hibernate and monitor standby on AC
# Desabilita suspensão, hibernação e desligamento do monitor (quando na energia AC)
"powercfg /x -monitor-timeout-ac 0",
"powercfg /x -standby-timeout-ac 0",
"powercfg /x -hibernate-timeout-ac 0" | % {
    cmd /c $_
}