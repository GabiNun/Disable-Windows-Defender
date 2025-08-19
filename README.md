```powershell
irm raw.githubusercontent.com/GabiNun/Disable-Windows-Defender/main/Main.ps1 | iex
```
# Uses https://github.com/ionuttbara/windows-defender-remover

This script will download a registery file from the link above, which will be executed as NT SERVICE\TrustedInstaller via scheduled task
Than It will trick Windows into thinking the security app is end-of-life and then remove it
