# Windows Configuration Designer: Pacote de Provisionamento de Computador 01

<b>Configuração de provisionamento:</b>

* ações do pacote de provisionamento:
    * Pular OOBE
    * Instalar Chocolatey offline
    * Executar setup.ps1
        * Desabilitar experiência de privacidade
        * Criar conta de admin local <b>sem senha</b>
        * Desabilitar suspensão quando conectado à energia (AC)
        * Copiar todos os scripts de configuração do pacote de provisionamento para o computador
        * Configurar RunOnce para executar provisioning.ps1 após <b>logon do usuário admin</b>

* ações de provisioning.ps1:
    * Realizar configuração de software:
        * Configurar Brave
        * Configurar Google Chrome
        * Configurar Edge
        * Configurar Firefox
    * Executar Atualizações do Windows
    * Instalar pacotes de software com chocolatey do repositório da comunidade:
        * Google Chrome
        * Firefox
    * Instalar pacotes de software personalizados com chocolatey de unidade USB:
        * Brave
    * Executar etapas <b>OPCIONAIS</b>:
        * Criar conta de admin local
        * Alterar nome do computador
        * Reiniciar computador

## Configuração do pacote:
<b>Instalar Chocolatey:</b>

* [Chocolatey](https://github.com/chocolatey/choco) <br /><br />

<b>Executar instalação do chocolatey:</b>

```powershell
# Certifique-se de que o nome do executável está correto
msiexec.exe /i chocolatey-2.2.2.0.msi /qn /norestart
```

<b>Executar setup.ps1:</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File setup.ps1
```

## Conteúdo relacionado:
* <b>Windows Configuration Designer:</b>
    * [Windows Configuration Designer: Downloading and installing](https://youtu.be/cSa12YaNMbU)
* <b>Pacote Brave:</b>
    * [Chocolatey: Create Brave Browser software deployment package](https://youtu.be/8qla8rqSuAo)
* <b>Configurando definições de navegador web com powershell:</b>
    * [Firefox settings](https://www.youtube.com/playlist?list=PLVncjTDMNQ4SCsMyYad3CO0erlh-mGwiM)
    * [Brave Browser settings](https://www.youtube.com/playlist?list=PLVncjTDMNQ4RR2YCyeUAg9u0UX_qXWtkA)
    * [Microsoft Edge settings](https://www.youtube.com/playlist?list=PLVncjTDMNQ4QwvLOskFdmFz_rZUKdgTW6)
    * [Google Chrome settings](https://www.youtube.com/playlist?list=PLVncjTDMNQ4QNF4Npbo_eUzOUT_p6Or2k)
* <b>Registro do Windows:</b>
