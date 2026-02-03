# Windows Configuration Designer: Provisionamento de software usando PowerShell
<b>Objetivos:</b>

* Instalar software usando powershell (para evitar limite de 20min):
    * VLC
    * Adobe Acrobat Reader DC
    * 7-Zip
    * Google Chrome
    * Zoom
    * Firefox
    * Telegram
    * Brave
* Pular OOBE
* Criar usuário admin sem senha
* Adicionar admin ao grupo Administrators
* Pular "Experiência de Privacidade"
* Desabilitar UAC (solicitação do visualizador, não recomendo fazer isso e você pode pular esta etapa)

<b>Documentação:</b>

* [Start-Process](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process?view=powershell-7.3)

<b>Lista de software de instalação em todo o sistema (Machine wide):</b>

* [VLC](https://www.videolan.org/)
    * <b>switch silencioso: </b>/S
* [Adobe Acrobat Reader DC](https://get.adobe.com/reader/enterprise/)
    * <b>switch silencioso: </b>/sAll /rs /msi EULA_ACCEPT=YES
* [7-Zip](https://7-zip.org/download.html)
    * <b>switch silencioso: </b>/S
* [Google Chrome](https://chromeenterprise.google/browser/download/#windows-tab)
    * <b>switch silencioso: </b>/qn /norestart
* [Zoom](https://support.zoom.us/hc/en-us/articles/207373866-Zoom-Installers)
    * <b>switch silencioso: </b>/qn /norestart
* [Firefox](https://www.mozilla.org/en-US/firefox/all/#product-desktop-release)
    * <b>switch silencioso: </b>/S

<b>Lista de software de instalação por usuário (User wide):</b>

* [Telegram](https://desktop.telegram.org/)
    * <b>switch silencioso: </b>/VERYSILENT /NORESTART
* [Brave](https://github.com/brave/brave-browser)
    * <b>switch silencioso: </b>N/A

<b>Switches silenciosos</b>

* [letsdoautomation](https://github.com/letsdoautomation/silent-software-installations/tree/main)
* [community.chocolatey.org](https://community.chocolatey.org/packages)

<b>Executar setup.ps1</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File setup.ps1
```

<b>Desabilitar "Experiência de Privacidade"</b>

<img src="img/privacySettings.png" width=40% height=40%>

```powershell
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE /v DisablePrivacyExperience /t REG_DWORD /d 1
```

<b>Desabilitar UAC</b>

```powershell 
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
```

<b>Criar usuário admin e adicionar ao grupo Administrators</b>
```powershell
cmd /c net user admin /add && net localgroup administrators admin /add
```

# Vídeos relacionados
<b>Registro do Windows</b>

[Windows Registry: Run and RunOnce](https://youtu.be/zgFzCq5uEPw) <br />
[Windows Registry: Active Setup](https://youtu.be/HrVJ7wdvfmo) <br />

<b>Windows Configuration Designer</b>

[Windows Configuration Designer: Downloading and installing](https://youtu.be/cSa12YaNMbU) <br />
[Windows Configuration Designer: Configuring WiFi connection](https://youtu.be/S2ysvv4KvRY) <br />
