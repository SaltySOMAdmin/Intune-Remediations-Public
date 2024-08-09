# Create Function to test if the registry Value Exists
Function Test-RegistryValue ($RegistryPath, $ValueName, $ValueData) {
     if ((Get-ItemPropertyValue -Path $RegistryPath -Name $ValueName -ErrorAction Ignore) -eq $ValueData) {
         Write-Output 'Exists'
		 EXIT 1
     } else {
         Write-Output 'No Exists'
		 EXIT 0
     }
 }

	# Set variables to indicate value and key to set
	$RegistryPath = 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\'
	$ValueName    = 'DisableOSUpgrade'
	$ValueData    = '1'
	$Type		  = 'REG_DWORD'
	
	# Call Function to test and set registry
	Test-RegistryValue $RegistryPath $ValueName $ValueData $Type