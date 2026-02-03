# Windows Configuration Designer: Remover bloatware do Windows 11 e configurar menu Iniciar

<b>Objetivos:</b>

* Executar oobe-setup.ps1
    * Criar usuário admin local
    * Pular "Experiência de Privacidade"
    * Executar oobe-bloatware.ps1
        * Remover aplicativos padrão da Windows Store
        * Configurar layout do menu Iniciar
        * Impedir instalação do OneDrive, Outlook (novo) e Dev Home
* Pular OOBE


<b>Localização do layout do menu Iniciar:</b>

```powershell
%LOCALAPPDATA%\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\
```

<b>Executar setup.ps1:</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File oobe-setup.ps1
```

## Vídeos relacionados

<b>PowerShell:</b>

[PowerShell: Export StartLayout, Import StartLayout alternatives for Windows 11](https://youtu.be/j-8FmXk8ssg) <br />
[PowerShell: Using Get-AppxProvisionedPackage, Remove-AppxProvisionedPackage to modify Online image](https://youtu.be/SevFgIkzAKk) <br />

<b>Windows:</b>

[Windows: Prevent Outlook new and Dev Home from installing for new users](https://youtu.be/zkN0DyI9mLI) <br />
[Windows: Prevent OneDrive from installing for new users](https://youtu.be/-u2MbM-ROto) <br />

<b>Registro do Windows:</b>

[Windows Registry: Run and RunOnce](https://youtu.be/zgFzCq5uEPw) <br />
[Windows Registry: Active Setup](https://youtu.be/HrVJ7wdvfmo)

<b>Windows Configuration Designer:</b>

[Windows Configuration Designer: Skip Out-Of-Box Experience](https://youtu.be/Lqf4i1nHV7I) <br />
[Windows Configuration Designer playlist](https://www.youtube.com/playlist?list=PLVncjTDMNQ4SAh9zjdreUBYSzSf7L5IX2)
