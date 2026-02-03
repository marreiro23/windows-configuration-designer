# ============================================================================
# Script: desktop-provisioning.ps1
# Função: Instalar Google Chrome após primeiro logon
# Dependências: 
#   - googlechromestandaloneenterprise64.msi (deve estar em $provisioning)
#   - msiexec (ferramenta nativa do Windows)
# Descrição:
#   - Executado automaticamente via RunOnce após primeiro logon
#   - Instala Google Chrome silenciosamente usando msiexec
# ============================================================================

param(
    [System.IO.DirectoryInfo]$provisioning
)

# Instala Google Chrome Enterprise silenciosamente
# /i = instalar, /qn = modo silencioso, /norestart = não reiniciar
$install_msi = @{
    FilePath     = "msiexec"
    ArgumentList = "/i $($provisioning.FullName)\googlechromestandaloneenterprise64.msi /qn /norestart"
    PassThru     = $true
    Wait         = $true
}
Start-Process @install_msi

Write-Host "Done" -BackgroundColor Green
Read-Host