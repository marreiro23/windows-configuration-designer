# ============================================================================
# Script: provisioning.ps1
# Função: Instalar atualizações do Windows usando PSWindowsUpdate
# Dependências:
#   - Conexão com internet
#   - NuGet (instalado automaticamente se necessário)
#   - Módulo PSWindowsUpdate (instalado automaticamente se necessário)
# Descrição:
#   - Aguarda conexão de rede disponível
#   - Instala NuGet provider se não estiver instalado
#   - Instala módulo PSWindowsUpdate se não estiver instalado
#   - Busca e instala atualizações do Windows disponíveis
#   - Reinicia o computador se necessário e agenda nova execução
# ============================================================================

# Wait for network
# Aguarda até que a conexão de rede esteja disponível
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

##
# Windows Update part
##
# Setup Windows Update
# Instala NuGet provider se não estiver presente
$nuget = Get-PackageProvider 'NuGet' -ListAvailable -ErrorAction SilentlyContinue

if ($null -eq $nuget) {
    Install-PackageProvider -Name NuGet -Confirm:$false -Force
}

# Instala o módulo PSWindowsUpdate se não estiver presente
$module = Get-Module 'PSWindowsUpdate' -ListAvailable

if ($null -eq $module) {
    Install-Module PSWindowsUpdate -Confirm:$false -Force
}
# Install Windows Updates
# Busca e instala todas as atualizações disponíveis do Windows
$updates = Get-WindowsUpdate

if ($null -ne $updates) {
    Install-WindowsUpdate -AcceptAll -Install -IgnoreReboot | select KB, Result, Title, Size
}

# Verifica se é necessário reiniciar o computador
$status = Get-WURebootStatus -Silent

if ($status) {
    # Se reinicialização necessária, agenda nova execução deste script após o boot
    $setup_runonce = @{
        Path  = "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
        Name  = "execute_provisioning"
        Value = "cmd /c powershell.exe -ExecutionPolicy Bypass -File {0}\provisioning.ps1" -f "$($env:ProgramData)\provisioning"
    }
    New-ItemProperty @setup_runonce | Out-Null
    Restart-Computer
}
else {
    # best place to add more actions
    # Melhor lugar para adicionar mais ações de provisionamento após as atualizações
}

Write-Host "All Done!" -ForegroundColor Green
Read-Host