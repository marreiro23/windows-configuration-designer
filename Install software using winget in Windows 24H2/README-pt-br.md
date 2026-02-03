# Windows Configuration Designer: Instalar software usando winget no Windows 24H2

<b>Solicitação:</b>

<img src="img/request.png" width=100% height=100%>

## Ações automatizadas

* Ações realizadas no OOBE pelo pacote de provisionamento:
  * Pular OOBE
  * Executar oobe-setup.ps1
    * Criar C:\ProgramData\provisioning
    * Copiar arquivos do pacote de provisionamento para o diretório C:\ProgramData\provisioning
    * Criar usuário administrador local
    * Desabilitar menu de experiência de privacidade
    * Configurar RunOnce para executar desktop-provisioning.ps1
* Ações realizadas por desktop-provisioning.ps1 na Área de Trabalho do usuário de provisionamento
  * Aguardar conexão com internet
  * Aguardar instalação do winget
  * Instalar software usando winget
    * Adobe Reader
    * Google Chrome
    * 7-zip
    * Mozilla Firefox
    * Zoom
    * Visual studio code
    * VLC

<b>Execução do oobe-setup.ps1:</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File oobe-setup.ps1
```

## Vídeos relacionados

<b>PowerShell:</b>

* [PowerShell playlist](https://www.youtube.com/playlist?list=PLVncjTDMNQ4RDyVzbV0_kpXCScTMgUw_A)

<b>Windows Configuration Designer:</b>

* [Windows Configuration Designer playlist](https://www.youtube.com/playlist?list=PLVncjTDMNQ4SAh9zjdreUBYSzSf7L5IX2)
* [Windows Configuration Designer: Downloading and installing](https://youtu.be/cSa12YaNMbU)
* [Windows Configuration Designer: Skip Out-Of-Box Experience](https://youtu.be/Lqf4i1nHV7I)
* [Windows Configuration Designer: Remove Windows 11 bloatware and configure start menu](https://youtu.be/lpbrQIvKGI4)
