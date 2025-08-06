irm raw.githubusercontent.com/GabiNun/Windows-Defender-Remover/main/Defender.reg -OutFile $Env:Temp\Defender.reg
reg import $Env:Temp\Defender.reg
