# Windows Configuration Designer: Instalando software com Ninite

<b>Observações:</b>

* A instalação de software via Ninite precisa ser o último passo no processo de provisionamento

<b>Pacote:</b>

* Ações realizadas no OOBE pelo pacote de provisionamento
  * Pular OOBE 
  * Executar oobe-setup.ps1
    * Criar conta admin
    * Mover arquivos do pacote de provisionamento para a pasta C:\ProgramData\Provisioning
    * Configurar RunOnce para executar desktop-provisioning.ps1
    * Desabilitar menu de experiência de privacidade
* Ações realizadas na área de trabalho do usuário por desktop-provisioning.ps1
  * Aguardar conexão de rede
  * Instalar software usando Ninite

<b>Downloads:</b>

* [Ninite](https://ninite.com/)

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
