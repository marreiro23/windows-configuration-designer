# ============================================================================
# Script: oobe-setup.ps1
# Função: Remover bloatware e configurar Windows 11
# Dependências: oobe-bloatware.ps1 (no mesmo diretório)
# Descrição:
#   - Executa oobe-bloatware.ps1 para remover apps desnecessários
#   - Cria conta de administrador local
#   - Desabilita Experiência de Privacidade
#   - Configura definições de energia
# ============================================================================

# Execute oobe scripts
# Executa o script de remoção de bloatware
. .\oobe-bloatware.ps1

# Create local admin account
# Cria conta de administrador local sem senha
$local_user = @{
    Name                 = 'admin'
    NoPassword           = $true
}

$user = New-LocalUser @local_user 
$user | Set-LocalUser -PasswordNeverExpires $true 
$user | Add-LocalGroupMember -Group "Administrators"

# Skip privacy experiance
# Desabilita a tela de Experiência de Privacidade no primeiro logon
$settings =
[PSCustomObject]@{
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

# Configure power settings
# Disable sleep, hibernate and monitor standby on AC
# Desabilita suspensão, hibernação e desligamento do monitor
"powercfg /x -monitor-timeout-ac 0",
"powercfg /x -standby-timeout-ac 0",
"powercfg /x -hibernate-timeout-ac 0" | % {
    cmd /c $_
}
