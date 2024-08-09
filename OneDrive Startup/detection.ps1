# Detect if registry value exists
# Created 9/25/23 for upload into MEM
# Last edit/upload 9/25/23

#mount HKU
New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS

#Get SID from current user
$username = Get-WMIObject -class Win32_ComputerSystem | select -ExpandProperty username
$SID = ([System.Security.Principal.NTAccount]("$username")).Translate([System.Security.Principal.SecurityIdentifier]).Value

If (-NOT (Get-ItemProperty $RegistryPath $ValueName -ErrorAction Ignore)){
	Write-Output "Key Does Not Exist"
	Exit 2
}
# Create Function to test if the registry Value Exists
Function Test-RegistryValue ($RegistryPath, $ValueName, $ValueData) {
     if ((Get-ItemPropertyValue -Path $RegistryPath -Name $ValueName -ErrorAction Ignore) -eq $ValueData) {
         Write-Output 'Exists'
		 #Remove-ItemProperty -Path $RegistryPath -recurse #$ValueName $ValueData $Type
         #Remove-Item -Path $RegistryPath -Recurse
		 Exit 0
     } else {
         Write-Output 'Value Does Not Exist'
		 Exit 1
     }
 }
 
#Function Remove-RegistryValue ($RegistryPath, $ValueName) {
	#Remove-ItemProperty -Path $RegistryPath -Name $ValueName
#}
	
	# Set variables to indicate value and key to set
	$RegistryPath = "HKU:\$SID\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run"
	$ValueName    = 'OneDrive'
	$ValueData    = '2'
	#$ValueData    = "([byte[]](0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00))"
	$Type		  = 'REG_BINARY'
	
	# Call Function to test registry
	Test-RegistryValue $RegistryPath $ValueName $ValueData $Type


Remove-PSDrive -name HKU