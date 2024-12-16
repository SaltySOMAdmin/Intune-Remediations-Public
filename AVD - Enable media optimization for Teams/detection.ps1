# Detect if registry value exists
# Created 9/25/23 for upload into MEM
# Last edit/upload 9/25/23


# Create Function to test if the registry Value Exists
Function Test-RegistryValue ($RegistryPath, $ValueName, $ValueData) {
     if ((Get-ItemPropertyValue -Path $RegistryPath -Name $ValueName -ErrorAction Ignore) -eq $ValueData) {
         Write-Output 'Exists'
		 exit 0

     } else {
         Write-Output 'Does Not Exist'
		 Exit 1
     }
 }
 
#Function Remove-RegistryValue ($RegistryPath, $ValueName) {
	#Remove-ItemProperty -Path $RegistryPath -Name $ValueName
#}

	# Set variables to indicate value and key to set
	$RegistryPath = 'HKLM:\SOFTWARE\Microsoft\Teams'
	$ValueName    = 'IsWVDEnvironment'
	$ValueData    = '1'
	$Type		  = 'DWORD' #string,expandstring,binary,dword,multistring.qword
	
	# Call Function to test and set registry
	Test-RegistryValue $RegistryPath $ValueName $ValueData $Type
	
	