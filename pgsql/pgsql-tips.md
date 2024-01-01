Enabling access for network/remote users
========================================

postgresql.conf:
    
    listen_addresses = '*'

pg_hba.conf:
    
    #TYPE   DATABAS EUSER   CIDR-ADDRESS    METHOD
    host    all     all     0.0.0.0/0       md5


list all the dbs

    psql -l

user manage

    createuser -P siko

    ALTER USER davide WITH PASSWORD 'hu8jmn3';
    
    createdb -E UTF8 -T template0 newdatabase

backup and restore

    pg_restore -d biz -U postgres -W biz.dump
    pg_dump -Fc -U postgres biz > biz.dump

    pg_dump -Fc database > db.dump
    pg_restore -d database db.dump

    
    dsc=# \encoding GBK 
    dsc=# show client_encoding;

phppgadmin
==========

    $conf['servers'][0]['host'] = 'localhost';

pgsql datatype
==============

http://www.postgresql.org/docs/9.3/static/datatype.html


install pgsql on wsl
===

```sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
 
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
 
sudo apt-get update
 
sudo apt-get -y install postgresql postgresql-contrib
 
psql --version
psql (PostgreSQL) 15.2 (Ubuntu 15.2-1.pgdg22.04+1)
 
sudo service postgresql status
15/main (port 5432): down
 
sudo service postgresql start
 * Starting PostgreSQL 15 database server```

