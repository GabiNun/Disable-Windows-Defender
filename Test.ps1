$store = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore';$appx = Get-AppxPackage Microsoft.SecHealthUI
('S-1-5-18'+(Get-ChildItem $store -ea 0|% PSChildName|?{$_ -like 'S-1-5-21*'}))|%{New-Item "$store\EndOfLife\$_\$($appx.PackageFullName)" -Force|Out-Null};$appx | Remove-AppxPackage
