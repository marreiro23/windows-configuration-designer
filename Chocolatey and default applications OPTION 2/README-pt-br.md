# Windows Configuration Designer: Chocolatey e aplicações padrão OPÇÃO 2

<b>Downloads:</b>

* [Chocolatey](https://github.com/chocolatey/choco)
* [Google Chrome](https://chromeenterprise.google/browser/download/#windows-tab)
* [Adobe Acrobat Reader DC](https://get.adobe.com/reader/enterprise/)

<b>Objetivos:</b>

* Provisionar software com chocolatey
    * 7-Zip
    * Notepad++
    * VLC
* Executar instalação offline
    * Google Chrome
    * Adobe Reader
* Definir aplicações padrão
    * Google Chrome como navegador padrão
    * Adobe Reader como leitor de PDF padrão
* Executar todas as outras ações de configuração OOBE até a área de trabalho sem interação do usuário
    * Pular OOBE
    * Pular "Experiência de Privacidade"
    * Criar usuário "admin" sem senha
    * Desabilitar suspensão

<b>Ordem de execução:</b>

* <b>OOBE:</b>
    * Pular OOBE
    * Executar oobe-setup.ps1
        * Executar oobe-chocolatey.ps1
            * Instalar Chocolatey
        * Executar oobe-software.ps1
            * Instalar Adobe Reader
            * Instalar Google Chrome
        * Executar oobe-associations.ps1
            * Definir Google Chrome como navegador padrão
            * Definir Adobe Reader como leitor de PDF padrão
        * Criar usuário "admin" sem senha
        * Pular menu "Experiência de Privacidade"
        * Desabilitar suspensão
        * Configurar Active Setup para executar desktop-provisioning.ps1
* <b>Script desktop-provisioning.ps1:</b>
    * Aguardar conexão de rede
    * Instalar 7-Zip
    * Instalar Notepad++
    * Instalar VLC

<b>Observações:</b>
