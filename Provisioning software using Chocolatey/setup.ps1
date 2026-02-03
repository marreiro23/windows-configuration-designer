# ============================================================================
# Script: setup.ps1
# Função: Preparar provisionamento via Chocolatey
# Dependências: Nenhuma (utiliza cmdlets nativos do PowerShell)
# Descrição:
#   - Cria pasta C:\ProgramData\provisioning
#   - Copia todos os arquivos (exceto setup.ps1) para a pasta de provisionamento
#   - Configura RunOnce para executar provisioning.ps1 no próximo logon
# ============================================================================

$provisioning = "$($env:ProgramData)\provisioning"

# Cria o diretório de provisionamento
ni $provisioning -ItemType Directory -Force | Out-Null

# Copia todos os arquivos (exceto setup.ps1) para a pasta de provisionamento
gci -File | ?{$_.name -ne "setup.ps1"} | %{
    cp $_.FullName "$($provisioning)\$($_.name)" -Force
}

# Configura RunOnce para executar provisioning.ps1 após o próximo logon
New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce" -Name "execute_provisioning" -Value ("cmd /c powershell.exe -ExecutionPolicy Bypass -File {0}\provisioning.ps1" -f $provisioning)