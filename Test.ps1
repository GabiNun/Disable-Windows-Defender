$store = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore'
$sids = @('S-1-5-18') + (gci $store -ea 0 | % PSChildName | ?{ $_ -like 'S-1-5-21*' })
$sids | % { ni "$store\EndOfLife\$_\Microsoft.SecHealthUI_8wekyb3d8bbwe" -Fo | Out-Null }
Get-AppxPackage Microsoft.SecHealthUI | Remove-AppxPackage
