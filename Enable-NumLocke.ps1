$user = "pezzimenda"
reg load "HKU\User" "C:\Users\$user\NTUSER.DAT"
$regPath = Get-ItemProperty -Path "Registry::\HKEY_USERS\User\Control Panel\Keyboard"

if (!$regPath){
	New-Item -Path "Registry::\HKEY_USERS\User\Control Panel" -Name Keyboard 
	New-ItemProperty -Path "Registry::\HKEY_USERS\User\Control Panel\Keyboard" -Name InitialKeyboardIndicators -Value 2
} else { 
	Set-ItemProperty -Path "Registry::\HKEY_USERS\User\Control Panel\Keyboard" -Name InitialKeyboardIndicators -Value 2
}

reg unload "HKU\User"