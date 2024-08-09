#mount HKU
New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS

#Get SID from current user
$username = Get-WMIObject -class Win32_ComputerSystem | select -ExpandProperty username
$SID = ([System.Security.Principal.NTAccount]("$username")).Translate([System.Security.Principal.SecurityIdentifier]).Value	
	
	# Set variables to indicate value and key to set
	$RegistryPath = "HKU:\$SID\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run"
	$ValueName    = 'OneDrive'
	$ValueData    = '08'
	#$ValueData    = "([byte[]](0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))"
	$Type		  = 'BINARY'


#Set Reg Value
If (-NOT (Test-Path $RegistryPath)) {
		New-Item -Path $RegistryPath -Force | Out-Null
		}  
	# Set the Value data if the Value exists otherwise create the value and value data
	If (Get-ItemProperty $RegistryPath $ValueName -ErrorAction Ignore) {
		Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force
		}
	Else{
		New-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData -PropertyType $Type -Force
		}
		
#remove Mount
Remove-PSDrive -name HKU

