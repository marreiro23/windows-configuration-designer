# ============================================================================
# Script: provisioning.ps1
# Função: Instalar software usando Chocolatey
# Dependências: 
#   - Chocolatey (deve estar instalado previamente via Windows Configuration Designer)
#   - Conexão com internet (necessária para baixar pacotes)
# Descrição:
#   - Aguarda conexão de rede disponível
#   - Instala lista de software via Chocolatey
#   - Pacotes: Adobe Reader, Teams, Chrome, 7-Zip, Firefox, LibreOffice, VLC, Notepad++
# ============================================================================

# Wait for network
# Aguarda até que a conexão de rede esteja disponível (testa com Google DNS 8.8.8.8)
$ProgressPreference_bk = $ProgressPreference
$ProgressPreference = 'SilentlyContinue'
do{
    $ping = Test-NetConnection '8.8.8.8' -InformationLevel Quiet
    if(!$ping){
        cls
        'Wainting for network connection' | Out-Host
        sleep -s 5
    }
} while(!$ping)
$ProgressPreference = $ProgressPreference_bk

##
# Chocolatey part
##
# Chocolatey software installation
# Lista de pacotes a serem instalados via Chocolatey
$packages =
"adobereader",
"microsoft-teams.install",
"googlechrome",
"7zip.install",
"firefox",
"libreoffice-fresh",
"vlc",
"notepadplusplus.install"

# Instala cada pacote silenciosamente (-y) sem barra de progresso
$packages | %{
    choco install $_ -y --no-progress --ignore-checksums
}

# best place to add more actions
# Melhor lugar para adicionar mais ações de provisionamento

Write-Host "All Done!" -ForegroundColor Green
Read-Host