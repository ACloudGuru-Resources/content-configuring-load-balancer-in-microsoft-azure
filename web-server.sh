$HOSTNAME = `hostname`

if [ $1 == '']
then
echo "Please provide one parameter, the IP address of the load balancer"
exit
fi

apt-get install php libapache2-mod-php --assume-yes
apt-get install php php7.4-mysqli --assume-yes

rm -rf /var/www/html/index.html
rm -rf /var/www/html/index.php

echo "Hello there!" > /var/www/html/index.php
echo "I'm the webserver named '$HOSTNAME,' proud to server your request" >> /var/www/html/index.php

echo "<?php" >> /var/www/html/index.php
echo "\$connection = new mysqli('$1', 'demo', 'demo', 'demo');" >> /var/www/html/index.php
echo "\$result = \$connection->query('select * from demo');" >> /var/www/html/index.php

echo "while (\$row = \$result->fetch_assoc()) {" >> /var/www/html/index.php
echo "echo 'And I was able to connect to the SQL server named ' . \$row['name'];" >> /var/www/html/index.php 
echo "}" >> /var/www/html/index.php
echo "?>" >> /var/www/html/index.php
echo "" >> /var/www/html/index.php
