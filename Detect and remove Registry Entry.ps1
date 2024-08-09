# Detect if registry value exists
# Created 9/25/23 for upload into MEM
# Last edit/upload 9/25/23

#mount HKU
New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS

#Get SID from current user
$username = Get-WMIObject -class Win32_ComputerSystem | select -ExpandProperty username
$SID = ([System.Security.Principal.NTAccount]("$username")).Translate([System.Security.Principal.SecurityIdentifier]).Value


# Create Function to test if the registry Value Exists
Function Test-RegistryValue ($RegistryPath, $ValueName, $ValueData) {
     if ((Get-ItemPropertyValue -Path $RegistryPath -Name $ValueName -ErrorAction Ignore) -eq $ValueData) {
         Write-Output 'Exists'
		 #Remove-ItemProperty -Path $RegistryPath -recurse #$ValueName $ValueData $Type
         Remove-Item -Path $RegistryPath -Recurse

     } else {
         Write-Output 'Does Not Exist'
     }
 }
 
#Function Remove-RegistryValue ($RegistryPath, $ValueName) {
	#Remove-ItemProperty -Path $RegistryPath -Name $ValueName
#}

	# Set variables to indicate value and key to set
	$RegistryPath = 'HKLM:\SOFTWARE\WOW6432Node\SLI\HistoTrac\Databases\PatientViewer'
	$ValueName    = 'Datasource'
	$ValueData    = 'TOC-HLAHT'
	$Type		  = 'REG_SZ'
	
	# Call Function to test and set registry
	Test-RegistryValue $RegistryPath $ValueName $ValueData $Type
	
	# Set variables to indicate value and key to set
	$RegistryPath = "HKU:\$SID\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\WOW6432Node\SLI\HistoTrac\Databases\PatientViewer"
	$ValueName    = 'Datasource'
	$ValueData    = 'TOC-HLAHT'
	$Type		  = 'REG_SZ'
	
	# Call Function to test and set registry
	Test-RegistryValue $RegistryPath $ValueName $ValueData $Type

