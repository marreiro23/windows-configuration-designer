# Windows Configuration Designer: Chocolatey e aplicações padrão OPÇÃO 1

<b>Downloads:</b>

* [Chocolatey](https://github.com/chocolatey/choco)

<b>Objetivos:</b>

* Provisionar software com chocolatey
    * Google Chrome
    * Adobe Reader
    * 7-Zip
    * Notepad++
    * VLC
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
            * Instalar Adobe Reader
            * Instalar Google Chrome
        * Executar oobe-associations.ps1
            * Definir Google Chrome como navegador padrão
            * Definir Adobe Reader como leitor de PDF padrão
        * Criar usuário "admin" sem senha
        * Pular menu "Experiência de Privacidade"
        * Desabilitar suspensão
        * Configurar Active Setup para executar desktop-provisioning.ps1
