# Windows Configuration Designer: Chocolatey e Atualizações do Windows
<b>Objetivos:</b>

* Instalar atualizações do Windows
* Instalar software usando script Chocolatey:
    * adobereader
    * microsoft-teams.install
    * googlechrome
    * 7zip.install
    * firefox
    * libreoffice-fresh
    * vlc
    * notepadplusplus.install
* Pular OOBE
* Criar usuário admin sem senha
* Adicionar admin ao grupo Administrators
* Pular "Experiência de Privacidade"
* Desabilitar suspensão do monitor e computador

<b>Estágios de provisionamento</b>

* <b>Estágio do Windows Configuration Designer:</b>
    * Instalando Chocolatey
    * Configurando autologon
        * Pulando OOBE
        * Pulando "Experiência de Privacidade"
        * Criando usuário admin sem senha
        * Adicionando admin ao grupo Administrators
    * Desabilitando suspensão
    * Configurando chave de registro RUNONCE para executar provisioning.ps1 no estágio 2
* <b>Estágio Chocolatey usando script provisioning.ps1:</b>
    * Aguardando conexão de rede
    * Configurar PSWindowsUpdate
    * Instalando atualizações do Windows
    * Instalando software

<b>Executar setup.ps1</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File setup.ps1
```

<b>Instalar Chocolatey:</b>

* [Chocolatey](https://github.com/chocolatey/choco) <br /><br />

```powershell
# Certifique-se de que o nome do executável está correto
msiexec.exe /i chocolatey-2.2.2.0.msi /qn /norestart
```
