# Windows Configuration Designer: Configurar modo KIOSK de aplicação única

<b>Documentação:</b>

* [AssignedAccess (Windows Configuration Designer reference)](https://learn.microsoft.com/en-us/windows/configuration/wcd/wcd-assignedaccess#assignedaccesssettings)
* [Create an Assigned Access configuration XML file](https://learn.microsoft.com/en-us/windows/configuration/assigned-access/configuration-file?pivots=windows-11)
* [Configure Microsoft Edge kiosk mode](https://learn.microsoft.com/en-us/deployedge/microsoft-edge-configure-kiosk-mode)
* [Configure a restricted user experience (multi-app kiosk) with Assigned Access](https://learn.microsoft.com/en-us/windows/configuration/assigned-access/configure-multi-app-kiosk?tabs=ppkg)

<b>Solicitação:</b>

<img src="img/request.png" width=100% height=100%>

## Ações automatizadas

* Ações realizadas no OOBE pelo pacote de provisionamento
  * Desabilitar OOBE
  * Criar conta admin
  * Definir senha do admin para nunca expirar
  * Configurar Kiosk
    * Iniciar Edge na inicialização
    * Definir página inicial como C:\Kiosk\index.html
  * Implantar página web estática em C:\Kiosk\

<b>Implantar página web estática:</b>

```
cmd /c copy index.exe %TEMP% && cmd /c %TEMP%\index.exe -y -o"C:\Kiosk"
```

<b>Definir nunca expira para senha de admin:</b>

```
powershell.exe -Command Set-LocalUser -name admin -PasswordNeverExpires $true
```

## Vídeos relacionados

<b>PowerShell:</b>

* [PowerShell playlist](https://www.youtube.com/playlist?list=PLVncjTDMNQ4RDyVzbV0_kpXCScTMgUw_A)

<b>Windows Configuration Designer:</b>

* [Windows Configuration Designer playlist](https://www.youtube.com/playlist?list=PLVncjTDMNQ4SAh9zjdreUBYSzSf7L5IX2)
* [Windows Configuration Designer: Downloading and installing](https://youtu.be/cSa12YaNMbU)
