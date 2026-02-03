# Windows Configuration Designer: Configurando Associações de Aplicações Padrão

<b>Objetivos:</b>

* Instalar aplicações:
    * Google Chrome
    * Adobe Reader
* Executar oobe-setup.ps1
    * Criar usuário admin local
    * Pular "Experiência de Privacidade"
    * Executar oobe-associations.ps1
        * Google Chrome como navegador padrão
        * Adobe Reader como leitor de PDF padrão
* Pular OOBE

<b>Regras a seguir:</b>

* O software precisa ser instalado antes do <b>primeiro</b> login do usuário
* As Aplicações Padrão precisam ser definidas antes do <b>primeiro</b> login do usuário

<b>URLs de Download:</b>

* [Google Chrome](https://chromeenterprise.google/browser/download/#windows-tab)
* [Adobe Reader](https://get.adobe.com/reader/enterprise/)

<b>Instalar Google Chrome:</b>

```powershell
msiexec.exe /i googlechromestandaloneenterprise64.msi /qn /norestart
```

<b>Instalar Adobe Reader:</b>

```powershell
cmd /c AcroRdrDC2400220759_en_US.exe /sAll /rs /msi EULA_ACCEPT=YES
```

<b>Executar oobe-setup.ps1:</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File oobe-setup.ps1
```

## Vídeos relacionados

<b>PowerShell:</b>

* [Windows 11 set default applications for new users](https://youtu.be/K-o_iGZQPBo)

<b>Windows Configuration Designer:</b>

* [Windows Configuration Designer: Downloading and installing](https://youtu.be/cSa12YaNMbU)
* [Windows Configuration Designer playlist](https://www.youtube.com/playlist?list=PLVncjTDMNQ4SAh9zjdreUBYSzSf7L5IX2)
