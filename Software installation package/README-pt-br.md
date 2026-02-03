## Lista de software
Download [7-Zip](https://7-zip.org/download.html) <br />
```powershell
# Certifique-se de que o nome do executável está correto
msiexec.exe /i "7z2301-x64.msi" /quiet /qn /norestart
```
Download [Adobe Acrobat Reader DC](https://get.adobe.com/reader/enterprise/) <br />
```powershell
# Certifique-se de que o nome do executável está correto
cmd /c AcroRdrDC2300320244_en_US.exe /sAll /rs /msi EULA_ACCEPT=YES
```
Download [Firefox](https://www.mozilla.org/en-US/firefox/all/#product-desktop-release) <br />
```powershell
# Certifique-se de que o nome do executável está correto
msiexec.exe /i "Firefox Setup 115.0.2.msi" /quiet /qn /norestart
```
Download [Google Chrome Enterprise](https://chromeenterprise.google/browser/download/#windows-tab) <br />
```powershell
# Certifique-se de que o nome do executável está correto
msiexec.exe /i googlechromestandaloneenterprise64.msi /qn /norestart
```
Download [Notepad++](https://notepad-plus-plus.org/downloads/) <br />
```powershell
# Certifique-se de que o nome do executável está correto
cmd /c copy npp.8.5.4.Installer.x64.exe %TEMP% && cmd /c %TEMP%\npp.8.5.4.Installer.x64.exe /S
```
Download [VLC](https://www.videolan.org/) <br />
```powershell
# Certifique-se de que o nome do executável está correto
cmd /c copy vlc-3.0.18-win64.exe %TEMP% && cmd /c %TEMP%\vlc-3.0.18-win64.exe /S
```
Download [Visual Studio Code](https://code.visualstudio.com/Download) <br />
```powershell
# Certifique-se de que o nome do executável está correto
cmd /c copy VSCodeSetup-x64-1.80.1.exe %TEMP% && cmd /c %TEMP%\VSCodeSetup-x64-1.80.1.exe /VERYSILENT /NORESTART /SUPPRESSMSGBOXES /MERGETASKS=!runcode
```
Download [Zoom](https://support.zoom.us/hc/en-us/articles/207373866-Zoom-Installers) <br />
```powershell
# Certifique-se de que o nome do executável está correto
msiexec.exe /i ZoomInstallerFull.msi /quiet /qn /norestart
```
