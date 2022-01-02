## AddBulkGroupMesmbers
$GroupID = Read-Host -Prompt "Please enter Group ID"
$CSVPath = Read-Host -Prompt "Please enter CSV full path"

# Connect to MSOnline Module
Connect-MsolService

# Import CSV sheet that contains the list Of Object IDs
Import-CSv -Path $CSVPath | 
ForEach { 
    $UPN=$_.MemberId
    
    # Azure AD Group ID
    add-MsolGroupMember -GroupObjectId $GroupID -GroupMemberObjectId $UPN -GroupMemberType User

    Write-Host "$UPN has been added." -ForegroundColor Green
}

# To verify group memberships
''
''
Write-Host "$GroupID memebers has been updated as the following:" -ForegroundColor Green
Get-MsolGroupMember -GroupObjectId $GroupID