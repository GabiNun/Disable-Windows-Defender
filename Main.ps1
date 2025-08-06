irm raw.githubusercontent.com/GabiNun/Disable-Windows-Defender/main/Defender.reg -OutFile $Env:Temp\Defender.reg
Register-ScheduledTask -TaskName 'ImportDefenderReg' -Action (New-ScheduledTaskAction -Execute 'reg.exe' -Argument "import `"$env:TEMP\Defender.reg`"") | Out-Null
($s = New-Object -ComObject 'Schedule.Service').Connect(); $s.GetFolder('\').GetTask('ImportDefenderReg').RunEx($null, 0, 0, 'NT SERVICE\TrustedInstaller') | Out-Null
