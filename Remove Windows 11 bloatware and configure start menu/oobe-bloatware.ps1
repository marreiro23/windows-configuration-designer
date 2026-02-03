# ============================================================================
# Script: oobe-bloatware.ps1
# Função: Remover aplicativos desnecessários do Windows 11 (bloatware)
# Dependências: 
#   - Get-AppxProvisionedPackage (cmdlet nativo do Windows)
#   - start2.bin (arquivo de layout do menu Iniciar)
# Descrição:
#   - Remove apps provisionados da Microsoft Store (Camera, Clipchamp, Cortana, etc.)
#   - Implanta layout personalizado do menu Iniciar (start2.bin)
#   - Previne instalação automática do OneDrive
#   - Previne instalação automática do Outlook (novo) e Dev Home
# ============================================================================

# Remove Windows store apps
# Remove aplicativos pré-instalados da Windows Store para todos os usuários
$app_packages = 
"Microsoft.WindowsCamera",
"Clipchamp.Clipchamp",
"Microsoft.WindowsAlarms",
"Microsoft.549981C3F5F10", # Cortana
"Microsoft.WindowsFeedbackHub",
"microsoft.windowscommunicationsapps",
"Microsoft.WindowsMaps",
"Microsoft.ZuneMusic",
"Microsoft.BingNews",
"Microsoft.Todos",
"Microsoft.ZuneVideo",
"Microsoft.MicrosoftOfficeHub",
"Microsoft.OutlookForWindows",
"Microsoft.People",
"Microsoft.PowerAutomateDesktop",
"MicrosoftCorporationII.QuickAssist",
"Microsoft.ScreenSketch",
"Microsoft.MicrosoftSolitaireCollection",
"Microsoft.WindowsSoundRecorder",
"Microsoft.MicrosoftStickyNotes",
"Microsoft.BingWeather",
"Microsoft.Xbox.TCUI",
"Microsoft.GamingApp",
"Microsoft.Windows.Ai.Copilot.Provider"

Get-AppxProvisionedPackage -Online | ?{$_.DisplayName -in $app_packages} | Remove-AppxProvisionedPackage -Online -AllUser

# Deploy start layout
# Implanta layout personalizado do menu Iniciar para todos os usuários existentes
[System.IO.FileInfo]$start_layout = ".\start2.bin"

ls "C:\Users\" -Attributes Directory -Force | ?{$_.FullName -notin $env:USERPROFILE, $env:PUBLIC -and $_.Name -notin "All Users", "Default User"} | %{

    [System.IO.DirectoryInfo]$destination = "$($_.FullName)\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState"

    if(!$destination.Exists){
        $destination.Create()
    }

    $start_layout.CopyTo("$($destination)\start2.bin", $true)
}

# Prevent OneDrive from installing
# Previne instalação automática do OneDrive usando Active Setup
ni "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\DisableOneDrive" | New-ItemProperty -Name "StubPath" -Value 'REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v OneDriveSetup /f'

# Prevent Outlook (new) and Dev Home from installing
# Remove tarefas agendadas que instalam Outlook (novo) e Dev Home automaticamente
"HKLM:\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\DevHomeUpdate",
"HKLM:\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\OutlookUpdate",
"HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Orchestrator\UScheduler\OutlookUpdate",
"HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Orchestrator\UScheduler\DevHomeUpdate" | %{
    ri $_ -force
}