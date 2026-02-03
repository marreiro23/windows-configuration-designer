# Windows Configuration Designer: Permitir conexão à rede WiFi no OOBE

<b>Solicitação:</b>

<img src="img/request.png" width=100% height=100%>

<b>Observações:</b>

* Configuração para computadores com Windows OEM pré-instalado
* A melhor opção provavelmente seria injetar a configuração do OOBE na imagem de instalação do Windows

## Ações automatizadas

* Ações realizadas no OOBE pelo pacote de provisionamento:
  * Executar oobe-setup.ps1
    * Criar C:\ProgramData\provisioning
    * Copiar arquivos do pacote de provisionamento para o diretório C:\ProgramData\provisioning
    * Desabilitar animação de primeiro logon
    * Configurar RunOnce para executar desktop-provisioning.ps1
  *  Executar oobe-configure.ps1
     * Executar sysprep com unattend.xml
        * Ocultar tudo no OOBE exceto o menu de conexão à rede
        * Criar usuário admin
        * Configurar definições regionais en-us
* Ações realizadas por desktop-provisioning.ps1 na área de trabalho do usuário de provisionamento
  * Instalar Google Chrome

### Downloads

* [Google Chrome](https://chromeenterprise.google/download/)

<b>Execução do oobe-setup.ps1:</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File oobe-setup.ps1
```

<b>Execução do oobe-configure.ps1:</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File oobe-configure.ps1
```

## Vídeos relacionados

<b>PowerShell:</b>

* [PowerShell playlist](https://www.youtube.com/playlist?list=PLVncjTDMNQ4RDyVzbV0_kpXCScTMgUw_A)

<b>Windows Configuration Designer:</b>

* [Windows Configuration Designer playlist](https://www.youtube.com/playlist?list=PLVncjTDMNQ4SAh9zjdreUBYSzSf7L5IX2)
* [Windows Configuration Designer: Downloading and installing](https://youtu.be/cSa12YaNMbU)
* [Windows Configuration Designer: Skip Out-Of-Box Experience](https://youtu.be/Lqf4i1nHV7I)
* [Windows Configuration Designer: Remove Windows 11 bloatware and configure start menu](https://youtu.be/lpbrQIvKGI4)
