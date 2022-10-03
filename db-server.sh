$HOSTNAME = `hostname`

apt-get install mysql-server --assume-yes

mysql -u root -e "create database demo"
mysql -u root demo -e "create table demo (name varchar(255))"
mysql -u root demo -e "insert into demo (name) values ('$HOSTNAME')"

mysql -u root demo -e "CREATE USER 'demo' IDENTIFIED BY 'demo'"
mysql -u root demo -e "GRANT SELECT ON demo.demo TO 'demo'"

cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf.bak

cat /etc/mysql/mysql.conf.d/mysqld.cnf | grep -v bind-addresses > /etc/mysql/mysql.conf.d/mysqld.cnf.new
echo "bind-address = 0.0.0.0" >> /etc/mysql/mysql.conf.d/mysqld.cnf.new
echo "mysqlx-bind-address = 127.0.0.1" >> /etc/mysql/mysql.conf.d/mysqld.cnf.new

cp /etc/mysql/mysql.conf.d/mysqld.cnf.new /etc/mysql/mysql.conf.d/mysqld.cnf

/etc/init.d/mysql restart
