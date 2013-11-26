Enabling access for network/remote users
========================================

Add/edit the following line in your postgresql.conf:
    
    listen_addresses = '*'

Add the following line as the first line of pg_hba.conf, to allow access to all
databases for all users with an encrypted password:
    
    #TYPE   DATABAS EUSER   CIDR-ADDRESS    METHOD
    host    all     all     0.0.0.0/0       md5

