# Import the Active Directory module
Import-Module ActiveDirectory
$filePath = "c:\temp\computerlist.csv"

# Define the distinguished name (DN) of the Surgery OU
$ouDN = "OU="

# Get all computer accounts in the Surgery OU
$computersInSurgeryOU = Get-ADComputer -Filter {Enabled -eq $True} -SearchBase $ouDN -Property MemberOf, enabled

# Filter out computers that are not members of any groups
$computersNotInGroups = $computersInSurgeryOU | Where-Object { -not $_.MemberOf }

# Display the results
$computersNotInGroups | Select-Object Name | export-csv -path $filePath -NoTypeInformation

# Define the email parameters
$smtpServer = "smtprelay."   # Replace with your SMTP server
$from = ""   # Replace with your email address
$to = ""    # Replace with the recipient's email address
$subject = "List of AD Computers that have no group memberships"
$body = "Please find attached the list of Active Directory computers that have not been added to a group."
$attachment = $filePath

# Send the email with the CSV file as an attachment
Send-MailMessage -SmtpServer $smtpServer -From $from -To $to -Subject $subject -Body $body -Attachments $attachment -BodyAsHtml

# Optionally, delete the file after sending the email
Remove-Item -Path $filePath
