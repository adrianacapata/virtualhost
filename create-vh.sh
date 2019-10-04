echo -e "\e[92m*********************************************"
echo -e "*      Setting up new Virtual Host          *"
echo -e "*********************************************\e[0m "

echo "Create Virtual host? (y/N)"
read CREATE;

if [ $CREATE == 'Y' ] || [ $CREATE == 'y' ]
    then
    
    echo "Enter domain name"
    read DOMAIN
    echo "Are you in the root directory? (y/N)"
    read ROOTDIR

    if [ $ROOTDIR == 'Y' ] || [ $ROOTDIR == 'y' ]
    then
        DIRPATH="`pwd`"    

cd /etc/apache2/sites-available

echo -e "\e[92mNew configuration for virtual host ${DOMAIN} is available at etc/apache2/sites-available/${DOMAIN}.conf. Preview: \e[0m"

sudo tee -a "${DOMAIN}.conf" <<EOL
<VirtualHost *:80>
    ServerName ${DOMAIN}
    ServerAdmin webmaster@localhost

    Options +FollowSymlinks +Indexes

    DocumentRoot ${DIRPATH}
    <Directory "${DIRPATH}">
        AllowOverride All
        Order Deny,Allow
        Deny from All
        Allow from All
    </Directory>

    ErrorLog "/var/log/${DOMAIN}-error_log"
    CustomLog "/var/log/${DOMAIN}-access_log" combined
</VirtualHost> 
EOL

elif [ $ROOTDIR == 'n' ] || [ $ROOTDIR == 'N' ]
    then
        echo "Please enter full path of root project directory [/var/www/symfonyproject/public]"
        read DIRPATH
        cd /etc/apache2/sites-available

echo -e "\e[92mNew configuration for virtual host ${DOMAIN} is available at etc/apache2/sites-available/${DOMAIN}.conf. Preview: \e[0m"

sudo tee -a "${DOMAIN}.conf" <<EOL
<VirtualHost *:80>
    ServerName ${DOMAIN}
    ServerAdmin webmaster@localhost

    Options +FollowSymlinks +Indexes

    DocumentRoot ${DIRPATH}
    <Directory "${DIRPATH}">
        AllowOverride All
        Order Deny,Allow
        Deny from All
        Allow from All
    </Directory>

    ErrorLog "/var/log/${DOMAIN}-error_log"
    CustomLog "/var/log/${DOMAIN}-access_log" combined
</VirtualHost> 
EOL

fi
sudo a2ensite ${DOMAIN}.conf

sudo systemctl reload apache2

#add new url (this is the exact name the vhost file has) in hosts, so you can access it from browser
sudo sed -i "$ a 127.0.1.1 ${DOMAIN}" /etc/hosts
else
    echo -e "\e[92mBye, Bye\e[0m"
fi

