# Windows Configuration Designer: Implantar Office 2016 VL

<b>Downloads:</b>

 * [7-zip download page](https://www.7-zip.org/download.html) <br />
 * [Office Customization Tool (OCT) 2016 Help: Overview](https://learn.microsoft.com/en-us/deployoffice/oct/oct-2016-help-overview)<br />
* [Setup properties reference for Office 2013](https://learn.microsoft.com/en-us/previous-versions/office/office-2013-resource-kit/cc179018(v=office.15))

 <b>Objetivos:</b>

 * Criar pacote mínimo para ir do OOBE à área de trabalho do usuário e instalar Office 2016 VL
    * Instalar Office 2016 VL
    * Pular OOBE
    * Executar oobe-setup.ps1
        * Pular Experiência de Privacidade
        * Criar conta de administrador local
        * Configurar Definições de Energia

* Criar único executável para realizar instalação silenciosa do Office 2016 VL
    1. Criar arquivo de configuração MSP para realizar instalação silenciosa
    2. Empacotar todos os arquivos de instalação em um único executável

### Parte 1: Criando arquivo de configuração MSP

<b>Abrir Microsoft Office Customization Tool:</b>

```batch
setup.exe /admin
```

<b>Configurar propriedades:</b>

* Nome: SETUP_REBOOT
    * Valor: Never
* Nome: HIDEUPDATEUI
    * Valor: True

### Parte 2: Empacotando arquivos de instalação do Office 2016 VL em um único executável

<b>Criar executável auto-extraível de instalação:</b>

```batch
copy /b 7zS.sfx + config.txt + office.7z Office.exe
```

### Parte 3: Criando pacote de provisionamento

<b>Executar oobe-setup.ps1:</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File oobe-setup.ps1
```

<b>Executar instalação do Office 2016 VL:</b>

```batch
cmd /c copy Office.exe %TEMP% && cmd /c %TEMP%\Office.exe
```


## Vídeos relacionados

[Silent software installation: Microsoft Office 2016 VL](https://youtu.be/a2k2bTDR_KE) <br />
[Windows Tools: Self extracting  EXE archive with 7 zip](https://youtu.be/8Iaj9hbnnBA) <br />
[PowerShell: Get-LocalUser, New-LocalUser, Set-LocalUser, Disable-LocalUser and Enable, Remove](https://youtu.be/9PtT7FfPO3Q) <br />
[PowerShell: Windows 11 disable privacy experience for new users](https://youtu.be/YSVsOY2A7F8) <br />
[Windows Configuration Designer: Skip Out-Of-Box Experience](https://youtu.be/Lqf4i1nHV7I) <br />
[Windows Configuration Designer: Downloading and installing](https://youtu.be/cSa12YaNMbU)

