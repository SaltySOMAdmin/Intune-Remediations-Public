	# Set variables to indicate value and key to set
	$RegistryPath = 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\'
	$ValueName    = 'DisableOSUpgrade'
	$ValueData    = '0'
	$Type		  = 'REG_DWORD'
	

Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData  -Force

