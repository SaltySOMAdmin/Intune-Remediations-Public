#get-date
$timestamp = get-date -Format "MM/dd/yyyy"

#set object description
set-adcomputer -Identity $env:computername -Description "Disabled by Automation $timestamp"
