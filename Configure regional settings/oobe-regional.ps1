# ============================================================================
# Script: oobe-regional.ps1
# Função: Configurar definições regionais para Húngaro (hu-HU)
# Dependências: Cmdlets nativos do PowerShell (Set-TimeZone, Set-Culture, etc.)
# Descrição:
#   - Define fuso horário para Budapeste
#   - Configura idioma/região para Húngaro (hu-HU)
#   - Define teclado e localização
#   - Copia configurações para novos usuários e tela de boas-vindas
# ============================================================================

# configure time zone
# Configura o fuso horário para Budapeste
Get-TimeZone -ListAvailable | ?{$_.DisplayName -like "*Budapest*"} | Set-TimeZone

# configure regional/locale/keyboard settings
# Hungarian
# Configurações regionais para Húngaro (hu-HU)
$region = "hu-HU"

Set-Culture $region
Set-WinSystemLocale $region
Set-WinUserLanguageList $region, "en-us" -force -wa silentlycontinue
Set-WinHomeLocation 109

# copy regional settings to new user accounts and welcome screen
# Copia as configurações regionais para novos usuários e tela de boas-vindas
Copy-UserInternationalSettingsToSystem -WelcomeScreen $True -NewUser $True