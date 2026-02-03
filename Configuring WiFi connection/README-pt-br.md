# Windows Configuration Designer: Configurando conexão WiFi
<b>Objetivos:</b>

* Configurar definições de Wi-Fi
* Pular OOBE
* Criar usuário admin sem senha
* Adicionar admin ao grupo Administrators
* Pular "Experiência de Privacidade"

<b>Desabilitar "Experiência de Privacidade"</b>

<img src="img/privacySettings.png" width=40% height=40%>

```powershell
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE /v DisablePrivacyExperience /t REG_DWORD /d 1
```

<b>Criar usuário admin e adicionar ao grupo Administrators</b>
```powershell
cmd /c net user admin /add && net localgroup administrators admin /add
```

# Vídeos relacionados

<b>Windows Configuration Designer</b>

[Windows Configuration Designer: Downloading and installing](https://youtu.be/cSa12YaNMbU) <br />
