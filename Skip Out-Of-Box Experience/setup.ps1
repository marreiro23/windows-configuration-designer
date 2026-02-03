# ============================================================================
# Script: setup.ps1
# Função: Configuração inicial do Windows pós-OOBE (Out-Of-Box Experience)
# Dependências: Nenhuma (utiliza cmdlets nativos do PowerShell)
# Descrição: 
#   - Cria conta de administrador local sem senha
#   - Desabilita a Experiência de Privacidade do Windows
#   - Configura definições de energia para nunca suspender/hibernar
# ============================================================================

# Create local admin account
# Cria uma conta de administrador local chamada 'admin' sem senha
$local_user = @{
    Name                 = 'admin'
    NoPassword           = $true
}
$user = New-LocalUser @local_user 
$user | Set-LocalUser -PasswordNeverExpires $true 
$user | Add-LocalGroupMember -Group "Administrators"

# Skip "Privacy Experiance"
# Desabilita a tela de "Experiência de Privacidade" que aparece no primeiro login
# Configura chave do registro HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE
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
# Desabilita suspensão, hibernação e desligamento do monitor quando conectado à energia
# Utiliza o comando powercfg nativo do Windows
"powercfg /x -monitor-timeout-ac 0",
"powercfg /x -standby-timeout-ac 0",
"powercfg /x -hibernate-timeout-ac 0" | % {
    cmd /c $_
}