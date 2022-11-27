param([Parameter(Mandatory=$true)] $JSONFile)

function CreateADGroup(){
    param([Parameter(Mandatory=$true)] $groupObject)

    $name = $groupObject.name
    New-ADGroup -name $name -GroupScope Global
}

function CreateADUser() {
    param([Parameter(Mandatory=$true)] $userObject)

    # Pull out the name form the Json Object
    $name = $userObject.name
    $password = $userObject.password

    # Generate a "first initial, last name" structure for username
    $firstname, $lastname = $name.Split(" ")
    $username = ($firstname[0] + $lastname).ToLower()
    $smAccountName = $username
    $principalname = $username

    # Actually create the AD user Object
    New-ADUser -Name "$name" -GivenName $firstname -Surname $lastname -SamAccountName $smAccountName -UserPrincipalName $principalname@$Global:Domain -AccountPassword (ConverToString $password -AsPlainText -Force) -PassThru | Enable-ADAccount

    # Add the user to its appropriate group
    foreach($group_name in $userObject.$groups) {

        try{
            Get-ADGroup -Identity "$group_name"
            Add-ADGroupMember -Identity $group_name -Members $username
        }
        catch[Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException]{
            Write-Warning "User $name NOT Added to group $group_name because it does not exist"
        }
    }
}

$json = (Get-Content $JSONFile | ConvertFrom-Json)

$Global:Domain = $json.domain

foreach($group in $json.group){
    CreateADGroup $group
}

foreach($user in $json.users){
    CreateADUser $user
}