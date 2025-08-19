```powershell
irm raw.githubusercontent.com/GabiNun/Disable-Windows-Defender/main/Main.ps1 | iex
```
### Registry File Source
https://github.com/ionuttbara/windows-defender-remover

This script will download a registry file from the link above, which will be executed as **NT SERVICE\TrustedInstaller** via task scheduler.
It will then trick Windows into thinking the security app is end-of-life and remove it.
