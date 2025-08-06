irm raw.githubusercontent.com/GabiNun/Windows-Defender-Remover/main/Defender.reg -OutFile $Env:Temp\Defender.reg
$regImportAction = New-ScheduledTaskAction -Execute 'reg.exe' -Argument "import `"$env:TEMP\Defender.reg`""
Register-ScheduledTask -TaskName 'ImportDefenderReg' -Action $regImportAction | Out-Null
$svc = New-Object -ComObject 'Schedule.Service'
$svc.Connect()
$user = 'NT SERVICE\TrustedInstaller'
$folder = $svc.GetFolder('\')
$task = $folder.GetTask('ImportDefenderReg')
$task.RunEx($null, 0, 0, $user) | Out-Null
