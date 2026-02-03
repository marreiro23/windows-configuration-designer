# Windows Configuration Designer: Implantando configurações de registro de Máquina e Usuário

<b>Conteúdo do pacote:</b>

* Pular OOBE
* Executar oobe-setup.ps1
    * Executar oobe-machine-registry.ps1
        * Ocultar visualização de tarefas
        * Desabilitar widgets
        * Remover Home e Galeria do explorador
    * Executar oobe-user-registry.ps1
        * Configurar ActiveSetup para importar desktop-user-registry.reg via RunOnce
            * Habilitar menu de clique com botão direito antigo
            * Mover itens da barra de tarefas para a esquerda
            * Remover barra de pesquisa da barra de tarefas
    * Pular Experiência de Privacidade
    * Criar conta de administrador local
    * Configurar Definições de Energia

<b>Executar setup.ps1:</b>

```powershell
powershell.exe -ExecutionPolicy Bypass -File oobe-setup.ps1
```

### Vídeos relacionados

<b>Playlists:</b>

* [Windows 11 settings](https://www.youtube.com/playlist?list=PLVncjTDMNQ4St7rvA0w_nuv5CHxBccoLJ) <br />
* [Windows Configuration Designer](https://www.youtube.com/playlist?list=PLVncjTDMNQ4SAh9zjdreUBYSzSf7L5IX2) <br />
* [PowerShell](https://www.youtube.com/playlist?list=PLVncjTDMNQ4RDyVzbV0_kpXCScTMgUw_A) <br />
* [Windows Registry](https://www.youtube.com/playlist?list=PLVncjTDMNQ4TZrwwuYuZBZhpjs6YWw7sQ) <br />
