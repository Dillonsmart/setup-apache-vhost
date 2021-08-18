#!/bin/sh

echo "What is the document root for the new site? e.g /home/your-user/documents/example-site"
read DOCUMENTROOT
echo "What is the service alias? e.d example-site.local"
read SERVERALIAS

echo "Next steps, please verify"
echo "${SERVERALIAS}.conf will be created in /etc/apache2/sites-available"
echo "A symlink will be created between ${DOCUMENTROOT} and /var/www/html"

# VHOST File Contents 
VHOSTCONT="<VirtualHost *:80>\nServerAdmin webmaster@${SERVERALIAS}\nServerName ${SERVERALIAS}\nServerAlias ${SERVERALIAS}\nDocumentRoot ${DOCUMENTROOT}\nErrorLog ${APACHE_LOG_DIR}/error.log\nCustomLog ${APACHE_LOG_DIR}/access.log combined\n<Directory ${DOCUMENTROOT}>\nAllowOverride All\n</Directory>\n</VirtualHost>"

read -r -p "Are you happy to continue? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        
        cd /etc/apache2/sites-available
        touch ${SERVERALIAS}.conf 
        echo -en $VHOSTCONT > ${SERVERALIAS}.conf

        a2ensite ${SERVERALIAS}.conf
        systemctl reload apache2

        ln -s ${DOCUMENTROOT} /var/www/html

        echo "You need to edit /etc/hosts file and add the line: 127.0.0.1 ${SITEALIAS}" 

        ;;
    *)
        do_something_else
        ;;
esac
