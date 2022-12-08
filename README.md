# Active Directory 🪟
Just an Automation Code written for Setting-Up random users and admins for our AD.

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
![2](https://user-images.githubusercontent.com/93928268/206453024-7344008e-e9c1-44b8-8152-01525ee49957.png)

3. Add those users created in the `JSON` file to the AD.
```
.\add-users.ps1 .\users.json
```
![3](https://user-images.githubusercontent.com/93928268/206453168-59ecf3e5-9d64-43fa-9bd3-1818956a55cd.png)


## Adding Admins

4. Move into the `Admins` folder and create random admin's JSON file using `random-admins.ps1`.
```
.\random-admins.ps1 .\admin-users.json
```
![4](https://user-images.githubusercontent.com/93928268/206453212-5f36fc33-a74e-408d-be9f-66b7a7db8ba4.png)


5. Add the admins created in the `JSON` file to the AD.
```
.\add-admins.ps1 .\admin-users.json
```
![5](https://user-images.githubusercontent.com/93928268/206453247-8622813a-e697-433d-a92f-014177ae97c0.png)


## Adding Local Admins to the system

6. In the Admins folder itself Add the Local Admins present in the `Admins.json` file to the AD.
```
.\add-local_admins.ps1 .\Admins.json
```
![6](https://user-images.githubusercontent.com/93928268/206453293-09536376-71e4-49a7-bf7c-8d04e81a7ff5.png)


You can edit the `Admins.json` file to have your own custom users to added into the AD.

#
