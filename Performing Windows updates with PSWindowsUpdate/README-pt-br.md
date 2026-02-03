# Windows Configuration Designer: Executando atualizações do Windows com PSWindowsUpdate
<b>Objetivos:</b>

* Instalar atualizações do Windows
* Pular OOBE
* Criar usuário admin sem senha
* Adicionar admin ao grupo Administrators
* Pular "Experiência de Privacidade"
* Desabilitar suspensão do monitor e computador

<b>Estágios de provisionamento</b>

* <b>Estágio do Windows Configuration Designer:</b>
    * Configurando autologon
        * Pulando OOBE
        * Pulando "Experiência de Privacidade"
        * Criando usuário admin sem senha
        * Adicionando admin ao grupo Administrators
    * Desabilitando suspensão
* <b>Estágio do Windows Update usando script provisioning.ps1:</b>
    * Aguardando conexão de rede
    * Configurar PSWindowsUpdate
    * Instalando atualizações do Windows

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
