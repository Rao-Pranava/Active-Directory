# Active Directory 🪟
 Just Automation Code written for Setting-Up random users and admins for our AD.

# Usage of this Code
1. Clone this Repository.
```
git clone https://github.com/Rao-Pranava/Active-Directory.git
```
## Adding Local Users

2. Move into the `Active-Directory` Folder and create random user's JSON file using `random-users.ps1`.
```
.\random-users.ps1 ./users.json
```

3. Add those users created in the `JSON` file to the AD.
```
.\add-users.ps1 .\users.json
```

## Adding Admins

4. Move into the `Admins` folder and create random admin's JSON file using `random-admins.ps1`.
```
.\random-admins.ps1 .\admin-users.json
```

5. Add the admins created in the `JSON` file to the AD.
```
.\add-admins.ps1 .\admin-users.json
```

## Adding Local Admins to the system

6. In the Admins folder itself Add the Local Admins present in the `Admins.json` file to the AD.
```
.\add-local_admins.ps1 .\Admins.json
```

You can edit the `Admins.json` file to have your own custom users to added into the AD.

#
#