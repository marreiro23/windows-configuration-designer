# ============================================================================
# Script: desktop-provisioning.ps1
# Função: Instalar software usando Ninite
# Dependências:
#   - ninite.exe (deve estar na pasta $ProvisioningFolder)
#   - Conexão com internet (necessária para Ninite baixar instaladores)
# Descrição:
#   - Aguarda conexão de rede disponível
#   - Executa o instalador Ninite que instala múltiplos aplicativos
#   - Suporta tanto instaladores .msi quanto .exe
# ============================================================================

param(
    [System.IO.DirectoryInfo]$ProvisioningFolder
)

# wait for network
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

# Define o pacote Ninite a ser executado
$packages =
[PSCustomObject]@{
    Name = "Ninite"
    Exe  = "ninite.exe"
}

# Executa a instalação de cada pacote
foreach ($package in $packages) {
    Write-Host "Executing $($package.Name) installation."
    if ($package.exe -Like "*.msi") {
        $execute = @{
            FilePath     = "msiexec"
            ArgumentList = "/i $($ProvisioningFolder.FullName)\$($package.exe) $($package.SilentSwitch)"
            NoNewWindow  = $true
            PassThru     = $true
            Wait         = $true
        }
    }
    else {
        $execute = @{
            FilePath    = "$($ProvisioningFolder.FullName)\$($package.exe)"
            NoNewWindow = $true
            PassThru    = $true
            Wait        = $true
        }
        if (![string]::IsNullOrEmpty($package.SilentSwitch)) {
            $execute.ArgumentList = $package.SilentSwitch
        }
    }
    $result = Start-Process @execute
    Write-Host "    ExitCode: $($result.ExitCode)"
}

Read-Host