# Windows Configuration Designer: Pacote de implantação de arquivos

 <b>Objetivos:</b>

 * Criar pacote mínimo para ir do OOBE à área de trabalho do usuário e implantar arquivos
    * Implantar arquivos
    * Pular OOBE
    * Executar oobe-setup.ps1
        * Pular Experiência de Privacidade
        * Criar conta de administrador local
        * Configurar Definições de Energia

* Criar executável auto-extraível com 7-Zip

### Parte 1: Criando executável auto-extraível

### Parte 2: Criando pacote de provisionamento

<b>Executar oobe-setup.ps1:</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File oobe-setup.ps1
```

<b>Executar implantação de arquivos:</b>

```batch
cmd /c copy files.exe %TEMP% && cmd /c %TEMP%\files.exe -y -o"C:\Files"
```

## Vídeos relacionados

[Windows Tools: Self extracting  EXE archive with 7 zip](https://youtu.be/8Iaj9hbnnBA) <br />
[PowerShell: Get-LocalUser, New-LocalUser, Set-LocalUser, Disable-LocalUser and Enable, Remove](https://youtu.be/9PtT7FfPO3Q) <br />
[PowerShell: Windows 11 disable privacy experience for new users](https://youtu.be/YSVsOY2A7F8) <br />
[Windows Configuration Designer: Skip Out-Of-Box Experience](https://youtu.be/Lqf4i1nHV7I) <br />
[Windows Configuration Designer: Downloading and installing](https://youtu.be/cSa12YaNMbU)
