#mount HKU
New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS

#Get SID from current user
$username = Get-WMIObject -class Win32_ComputerSystem | select -ExpandProperty username
$SID = ([System.Security.Principal.NTAccount]("$username")).Translate([System.Security.Principal.SecurityIdentifier]).Value	
	
	# Set variables to indicate value and key to set
	$RegistryPath = "HKU:\$SID\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run"
	$ValueName    = 'OneDrive'
	$ValueData    = '2'
	#$ValueData    = "([byte[]](0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))"
	$Type		  = 'REG_BINARY'

#Set Reg Value
Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData  -Force

#remove Mount
Remove-PSDrive -name HKU

