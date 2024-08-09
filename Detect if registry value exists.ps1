# Detect if registry value exists
# Created 9/25/23 for upload into MEM
# Last edit/upload 9/25/23

# Create Function to test if the registry Value Exists
Function Test-RegistryValue ($RegistryPath, $ValueName, $ValueData) {
     if ((Get-ItemPropertyValue -Path $RegistryPath -Name $ValueName -ErrorAction Ignore) -eq $ValueData) {
         Write-Output 'Exists'
     } else {
         Write-Output 'No Exists'
     }
 }

	# Set variables to indicate value and key to set
	$RegistryPath = 'HKLM:\SOFTWARE\WOW6432Node\Google\Update\ClientState\{8A69D345-D564-463C-AFF1-A69D9E530F96}'
	$ValueName    = 'pv'
	$ValueData    = '114.0.5735.199'
	$Type		  = 'REG_SZ'
	
	# Call Function to test and set registry
	Test-RegistryValue $RegistryPath $ValueName $ValueData $Type
