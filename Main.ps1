irm raw.githubusercontent.com/GabiNun/Windows-Defender-Remover/main/Defender.reg -OutFile $Env:Temp\Defender.reg
$a = New-ScheduledTaskAction -Execute 'reg.exe' -Argument "import `"$env:TEMP\Defender.reg`""
Register-ScheduledTask -TaskName 'ImportDefenderReg' -Action $a | Out-Null
$svc = New-Object -ComObject 'Schedule.Service'
$svc.Connect()
$user = 'NT SERVICE\TrustedInstaller'
$folder = $svc.GetFolder('\')
$task = $folder.GetTask('ImportDefenderReg')
$task.RunEx($null, 0, 0, $user) | Out-Null
