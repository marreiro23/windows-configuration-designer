# Windows Configuration Designer: Configurar definições regionais

<b>Objetivos:</b>

* Criar pacote mínimo para ir do OOBE à área de trabalho do usuário e configurar definições regionais
    * Pular OOBE
    * Executar oobe-setup.ps1
        * Pular Experiência de Privacidade
        * Criar conta de administrador local
        * Configurar Definições de Energia
        * Executar oobe-regional.ps1 (Húngaro)
            * Configurar fuso horário
            * Configurar definições de teclado
            * Configurar localização inicial
            * Configurar locale
            * Configurar região
        * Configurar RunOnce para executar desktop-provisioning.ps1
            * Alterar idioma da interface para Húngaro

<b>Executar oobe-setup.ps1:</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File oobe-setup.ps1
```

### Vídeos relacionados

<b>Comandos PowerShell regionais:</b>

[Get-Culture, Set-Culture](https://youtu.be/gS4BckaTKto) <br />
[Get-InstalledLanguage, Install-Language, Get and Set-SystemPreferredUILanguage](https://youtu.be/eN-56mOM5GQ) <br />
[Get-TimeZone, Set-TimeZone](https://youtu.be/fmoIfJwvH-I) <br />
[Get-WinHomeLocation, Set-WinHomeLocation](https://youtu.be/yWp_1L8YDoQ) <br />
[Get-WinSystemLocale, Set-WinSystemLocale](https://youtu.be/rCGlh3hp1fI) <br />
[Get-WinUserLanguageList, Set-WinUserLanguageList](https://youtu.be/Bhl-rLB8g28) <br />

<b>Outros:</b>

[PowerShell: Get-LocalUser, New-LocalUser, Set-LocalUser, Disable-LocalUser and Enable, Remove](https://youtu.be/9PtT7FfPO3Q) <br />
[PowerShell: Windows 11 disable privacy experience for new users](https://youtu.be/YSVsOY2A7F8) <br />
[Windows Configuration Designer: Downloading and installing](https://youtu.be/cSa12YaNMbU)
