# Windows Configuration Designer: Pular Experiência Pronta para Uso (OOBE)

<b>Objetivos:</b>

* Criar pacote mínimo para ir do OOBE para a área de trabalho do usuário
    * Pular OOBE
    * Executar setup.ps1
        * Pular Experiência de Privacidade
        * Criar conta de administrador local
        * (OPCIONAL) Configurar Definições de Energia

<b>Executar setup.ps1:</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File setup.ps1
```

### Vídeos relacionados

[PowerShell: Get-LocalUser, New-LocalUser, Set-LocalUser, Disable-LocalUser and Enable, Remove](https://youtu.be/9PtT7FfPO3Q) <br />
[PowerShell: Windows 11 disable privacy experience for new users](https://youtu.be/YSVsOY2A7F8) <br />
[Windows Configuration Designer: Downloading and installing](https://youtu.be/cSa12YaNMbU)
