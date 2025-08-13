$store = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore'
$appx = Get-AppxPackage -AllUsers -Name "Microsoft.SecHealthUI" 
$sids = @('S-1-5-18')

if (Test-Path $store) { $sids += Get-ChildItem $store -ea 0 | %{ $_.PSChildName } | ?{ $_.StartsWith('S-1-5-21') } }
New-Item "$store\Deprovisioned\$($appx.PackageFamilyName)" -Force | Out-Null
foreach ($sid in $sids) { New-Item "$store\EndOfLife\$sid\$($appx.PackageFullName)" -Force | Out-Null }
$appx | Remove-AppxPackage
