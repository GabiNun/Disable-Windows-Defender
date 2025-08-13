$store = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore'

$sids = @('S-1-5-18') + @(if (Test-Path $store) { Get-ChildItem $store -ea 0 | % { $_.PSChildName } | ? { $_.StartsWith('S-1-5-21') } })
New-Item "$store\Deprovisioned\$(Get-AppxPackage -AllUsers -Name 'Microsoft.SecHealthUI').PackageFamilyName" -Force | Out-Null
$sids | % { New-Item "$store\EndOfLife\$_\$(Get-AppxPackage -AllUsers -Name 'Microsoft.SecHealthUI').PackageFullName" -Force | Out-Null }

Get-AppxPackage -AllUsers -Name 'Microsoft.SecHealthUI' | Remove-AppxPackage
