# Windows Configuration Designer: Provisionamento de software usando Chocolatey
<b>Objetivos:</b>

* Instalar software usando script do Chocolatey:
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
* <b>Estágio do Chocolatey usando script provisioning.ps1:</b>
    * Aguardando conexão de rede
    * Instalando software

<b>Instalar Chocolatey:</b>

* [Chocolatey](https://github.com/chocolatey/choco) <br /><br />

```powershell
# Certifique-se de que o nome do executável está correto
msiexec.exe /i chocolatey-2.2.2.0.msi /qn /norestart
```

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
