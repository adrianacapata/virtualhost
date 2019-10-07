# Add new virtual host in Linux/Ubuntu OS

This is a shell script to create a virtual host for Linux/Ubuntu (versions: from 12.04 - 19.04)

## Getting Started

you can download or clone this repository into your local machine and start using the shell script from your project root directory or from anywhere else

### Prerequisites

you have to give permissions to the file in order to run it:
```
sudo chmod 755 create-vh.sh
```
after this you can simply run the shell script:
```
./create-vh.sh
```
### Installing

the script will promt out the following question:
```
Create Virtual host? (y/N)
y
```
if you answer y or Y the script will ask you to enter the domain name that you will access through your browser URL:
```
Enter domain name
something.local
```
further on you will be asked if you are in the root directory of your project (the one that contains the index.php or .html file)
```
Are you in the root directory? (y/N)
n
```
if you are in the root directory simply type in y (Y), if not, you will be asked to enter the full path name e.g.:
```
Please enter full path of root project directory [/var/www/symfonyproject/public]:
/var/www/symfony2.8project/web
```
after this step you will be asked to enter your super user (sudo) password in order to enable the new configuration and you will see a preview of the new virtual host:
```
<VirtualHost *:80>
    ServerName something.local
    ServerAdmin webmaster@localhost

    Options +FollowSymlinks +Indexes

    DocumentRoot /var/www/symfony2.8project/web
    <Directory "/var/www/symfony2.8project/web">
        AllowOverride All
        Order Deny,Allow
        Deny from All
        Allow from All
    </Directory>

    ErrorLog "/var/log/something.local-error_log"
    CustomLog "/var/log/something.local-access_log" combined
</VirtualHost> 
```
