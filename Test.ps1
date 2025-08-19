irm raw.githubusercontent.com/ionuttbara/windows-defender-remover/main/Remove_Defender/RemoveDefender.reg -o $Env:Temp\Defender.reg
Register-ScheduledTask ImportDefenderReg -Action (New-ScheduledTaskAction reg.exe "import $env:TEMP\Defender.reg")|Out-Null
$svc=New-Object -Com 'Schedule.Service';$svc.Connect();$svc.GetFolder('\').GetTask('ImportDefenderReg').RunEx($null,0,0,'NT SERVICE\TrustedInstaller')
