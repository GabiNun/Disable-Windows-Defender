irm raw.githubusercontent.com/GabiNun/Windows-Defender-Remover/main/Defender.reg -OutFile $Env:Temp\Defender.reg
$ProgressPreference = 'SilentlyContinue';irm github.com/GabiNun/Windows-Defender-Remover/raw/main/PowerRun.exe -OutFile $Env:Temp\PowerRun.exe;& $Env:Temp\PowerRun.exe powershell -C "reg import $Env:Temp\Defender.reg"
