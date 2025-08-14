irm raw.githubusercontent.com/ionuttbara/windows-defender-remover/main/Remove_Defender/RemoveDefender.reg -o $Env:Temp\Defender.reg
Register-ScheduledTask -TaskName 'ImportDefenderReg' -Action (New-ScheduledTaskAction -Execute 'reg.exe' -Argument "import `"$env:TEMP\Defender.reg`"") | Out-Null
($s = New-Object -ComObject 'Schedule.Service').Connect(); $s.GetFolder('\').GetTask('ImportDefenderReg').RunEx($null, 0, 0, 'NT SERVICE\TrustedInstaller') | Out-Null

$store = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore';$appx = Get-AppxPackage -AllUsers -Name "Microsoft.SecHealthUI" ;$sids = @('S-1-5-18')

if (Test-Path $store) { $sids += Get-ChildItem $store -ea 0 | %{ $_.PSChildName } | ?{ $_.StartsWith('S-1-5-21') } }
New-Item "$store\Deprovisioned\$($appx.PackageFamilyName)" -Force | Out-Null
foreach ($sid in $sids) { New-Item "$store\EndOfLife\$sid\$($appx.PackageFullName)" -Force | Out-Null }
$appx | Remove-AppxPackage
