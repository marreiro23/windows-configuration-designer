# Windows Configuration Designer: Ingresso offline no domínio

<b>Documentação:</b>

[djoin](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/ff793312(v=ws.11))

<b>Observações:</b>

* O ingresso offline no domínio pode ser realizado sem conexão ao AD, mas a conexão ainda é necessária para o primeiro logon
  * Pode ser usado com VPN antes do logon 

<b>Ações do pacote:</b>

* Pular OOBE
* Executar oobe-setup.ps1
  * Desabilitar experiência de privacidade
* Executar oobe-offline-domain-join.ps1
  * Realizar ingresso offline no domínio
   * Remover arquivo de ingresso offline no domínio do USB
  * Reiniciar

<b>Criar múltiplos arquivos de ingresso offline no domínio:</b>

```powershell
$computers =
"NB01",
"NB02",
"NB03",
"NB04",
"NB05",
"NB06",
"NB07",
"NB08",
"NB10"

foreach($computer in $computers){
    djoin /provision /domain "ad.letsdoautomation.com" /machine $computer /machineou "OU=NewComputers,DC=ad,DC=letsdoautomation,DC=com" /savefile "C:\Users\$($env:USERNAME)\Desktop\djoin\$($computer).txt"
}
```

<b>Execução do oobe-offline-domain-join.ps1:</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File oobe-offline-domain-join.ps1 -usb_name "USB-256"
```

<b>Execução do oobe-setup.ps1:</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File oobe-setup.ps1
```

## Vídeos relacionados

<b>Windows Server:</b>

* [Offline domain join](https://youtu.be/3-L9Ak_kmlA)

<b>PowerShell:</b>

* [PowerShell playlist](https://www.youtube.com/playlist?list=PLVncjTDMNQ4RDyVzbV0_kpXCScTMgUw_A)

<b>Windows Configuration Designer:</b>

* [Windows Configuration Designer playlist](https://www.youtube.com/playlist?list=PLVncjTDMNQ4SAh9zjdreUBYSzSf7L5IX2)
* [Windows Configuration Designer: Downloading and installing](https://youtu.be/cSa12YaNMbU)
* [Windows Configuration Designer: Skip Out-Of-Box Experience](https://youtu.be/Lqf4i1nHV7I)
* [Windows Configuration Designer: Remove Windows 11 bloatware and configure start menu](https://youtu.be/lpbrQIvKGI4)
