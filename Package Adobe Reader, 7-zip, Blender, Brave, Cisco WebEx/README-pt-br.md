# Windows Configuration Designer: Pacote Adobe Reader, 7-zip, Blender, Brave, Cisco WebEx
<b>Objetivos:</b>

* Empacotar software:
    * 7-Zip
    * Adobe Acrobat Reader DC
    * Blender
    * Brave
    * Cisco WebEx

* Pular OOBE
* Criar usuário admin sem senha
* Adicionar admin ao grupo Administrators
* Pular "Experiência de Privacidade"

## Empacotando software

<b>Instalação em todo o sistema (Machine wide):</b><br />

* [7-Zip](https://7-zip.org/download.html)
    * msiexec.exe /i 7z2301-x64.msi /quiet /norestart ALLUSERS=1
* [Adobe Acrobat Reader DC](https://get.adobe.com/reader/enterprise/)
    * cmd /c AcroRdrDC2300620380_en_US.exe /sAll /rs /msi EULA_ACCEPT=YES
* [Blender](https://www.blender.org/)
    * msiexec.exe /i blender-4.0.1-windows-x64.msi /quiet /norestart ALLUSERS=1
* [Cisco WebEx](https://www.webex.com/downloads.html)
    * msiexec.exe /i Webex_en.msi /quiet /norestart ALLUSERS=1

<b>Instalação por usuário (User wide):</b><br />

* [Brave](https://github.com/brave/brave-browser)

## Criar usuário admin e adicionar ao grupo Administrators
```powershell
cmd /c net user admin /add && net localgroup administrators admin /add
```

## Desabilitar "Experiência de Privacidade" <br />
<img src="img/privacySettings.png" width=40% height=40%>

```powershell
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE /v DisablePrivacyExperience /t REG_DWORD /d 1
```

## Executar script Powershell
```powershell
powershell.exe -ExecutionPolicy Bypass -File run.ps1
```

# Vídeos relacionados
<b>Registro do Windows</b>

[Windows Registry: Run and RunOnce](https://youtu.be/zgFzCq5uEPw) <br />
[Windows Registry: Active Setup](https://youtu.be/HrVJ7wdvfmo) <br />

<b>Windows Configuration Designer</b>

[Windows Configuration Designer: Downloading and installing](https://youtu.be/cSa12YaNMbU)
