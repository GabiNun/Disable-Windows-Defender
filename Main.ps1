irm raw.githubusercontent.com/ionuttbara/windows-defender-remover/main/Remove_Defender/RemoveDefender.reg -o $Env:Temp\Defender.reg
Register-ScheduledTask -TaskName 'ImportDefenderReg' -Action (New-ScheduledTaskAction -Execute 'reg.exe' -Argument "import `"$env:TEMP\Defender.reg`"") | Out-Null
($s = New-Object -ComObject 'Schedule.Service').Connect(); $s.GetFolder('\').GetTask('ImportDefenderReg').RunEx($null, 0, 0, 'NT SERVICE\TrustedInstaller') | Out-Null


schtasks /create /tn "ImportDefenderReg" /tr "reg import %TEMP%\Defender.reg" /sc once /st 00:00 *> $null
(New-Object -Com 'Schedule.Service').Connect().GetFolder('\').GetTask('ImportDefenderReg').RunEx($null,0,0,'NT SERVICE\TrustedInstaller') | Out-Null
