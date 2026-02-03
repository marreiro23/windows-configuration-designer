# ============================================================================
# Script: desktop-provisioning.ps1
# Função: Instalar pacote de idioma Húngaro após primeiro logon
# Dependências: 
#   - Conexão com internet (necessária para instalar pacote de idioma)
#   - Cmdlets: Test-NetConnection, Install-Language, Set-SystemPreferredUILanguage
# Descrição:
#   - Aguarda conexão de rede disponível
#   - Instala pacote de idioma Húngaro se não estiver instalado
#   - Define Húngaro como idioma preferencial da UI do sistema
# ============================================================================

# wait for network
# Aguarda até que a conexão de rede esteja disponível (testa com Google DNS)
$ProgressPreference_bk = $ProgressPreference
$ProgressPreference = 'SilentlyContinue'
do {
    $ping = Test-NetConnection '8.8.8.8' -InformationLevel Quiet
    if (!$ping) {
        cls
        'Wainting for network connection' | Out-Host
        sleep -s 5
    }
} while (!$ping)
$ProgressPreference = $ProgressPreference_bk


# configure UI language
# Configura o idioma da interface do usuário para Húngaro
$language = "hu-HU"

$current_preferred_ui_lanague = Get-SystemPreferredUILanguage

if($language -ne $current_preferred_ui_lanague){
    $language_installed = Get-InstalledLanguage $language
    if(!$language_installed){
            $install_language = @{
            Language       = $language
        }
        Install-Language @install_language
    }
    Set-SystemPreferredUILanguage $language
}

Write-Host "All Done!" -ForegroundColor Green
Read-Host