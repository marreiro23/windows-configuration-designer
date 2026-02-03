# Windows Configuration Designer: Provisionamento de software usando winget
<b>Objetivos:</b>

* Instalar software usando script winget:
    * Adobe.Acrobat.Reader.64-bit
    * Microsoft.Teams.Classic
    * Google.Chrome
    * 7zip.7zip
    * Mozilla.Firefox
    * Zoom.Zoom
    * Microsoft.VisualStudioCode
    * VideoLAN.VLC
* Pular OOBE
* Criar usuário admin sem senha
* Adicionar admin ao grupo Administrators
* Pular "Experiência de Privacidade"
* Desabilitar suspensão do monitor e computador

<b>Estágios de provisionamento</b>

* <b>Estágio do Windows Configuration Designer:</b>
    * Preparando para o estágio winget com script setup.ps1:
        * Colocando arquivos de atualização do winget em C:\programdata\provisioning
        * Colocando provisioning.ps1 em C:\programdata\provisioning
        * Preparando RunOnce em HKLM para executar provisionamento de software
    * Configurando autologon
        * Pulando OOBE
        * Pulando "Experiência de Privacidade"
        * Criando usuário admin sem senha
        * Adicionando admin ao grupo Administrators
    * Desabilitando suspensão
* <b>Estágio Winget usando script provisioning.ps1:</b>
    * Atualizando winget
    * Aguardando conexão de rede
    * Instalando software

<b>Arquivos de atualização do Winget:</b>

* [Install winget on Windows Sandbox](https://learn.microsoft.com/en-us/windows/package-manager/winget/#install-winget-on-windows-sandbox) <br />

<b>Executar setup.ps1</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File setup.ps1
```

<b>Desabilitar "Experiência de Privacidade"</b>

<img src="img/privacySettings.png" width=40% height=40%>

```powershell
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE /v DisablePrivacyExperience /t REG_DWORD /d 1
```

<b>Criar usuário admin e adicionar ao grupo Administrators</b>
```powershell
cmd /c net user admin /add && net localgroup administrators admin /add
```

<b>Desabilitar suspensão do monitor e computador</b>
```powershell
cmd /c powercfg /x -monitor-timeout-ac 0 && powercfg /x -standby-timeout-ac 0
```

# Vídeos relacionados
<b>Registro do Windows</b>

[Windows Registry: Run and RunOnce](https://youtu.be/zgFzCq5uEPw) <br />
[Windows Registry: Active Setup](https://youtu.be/HrVJ7wdvfmo) <br />

<b>Windows Configuration Designer</b>

[Windows Configuration Designer: Downloading and installing](https://youtu.be/cSa12YaNMbU) <br />
[Windows Configuration Designer: Configuring WiFi connection](https://youtu.be/S2ysvv4KvRY) <br />
