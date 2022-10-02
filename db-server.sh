$HOSTNAME = `hostname`

apt-get install mysql-server --assume-yes

mysql -u root -e "create database demo"
mysql -u root demo -e "create table demo (name varchar(255))"
mysql -u root demo -e "insert into demo (name) values ('$HOSTNAME')"

mysql -u root demo -e "CREATE USER 'demo' IDENTIFIED BY 'demo'"
mysql -u root demo -e "GRANT SELECT ON demo.demo TO 'demo'"
