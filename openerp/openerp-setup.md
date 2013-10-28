OpenERP setup
====

Install PostgreSQL
----

    sudo apt-get install postgresql
    sudo su postgres
    createuser --createdb --username postgres --no-createrole --pwprompt siko

refer url

    http://doc.openerp.com/v7.0/install/linux/server/index.html
    http://doc.openerp.com/v7.0/install/linux/postgres/index.html


Create the virtual env.
----

    pythonbrew venv create openerp
    pythonbrew venv list
    pythonbrew venv use openerp


Install the requirments.
----

    sudo apt-get build-dep python-imaging
    sudo apt-get install libxml2-dev libxslt1-dev libsasl2-dev libldap2-dev

    pip install http://cheeseshop.python.org/packages/source/p/pyparsing/pyparsing-1.5.5.tar.gz
    pip install -e bzr+http://download.gna.org/pychart/bzr-archive#egg=pychart
    pip install babel feedparser gdata lxml mako psycopg2 pydot python-dateutil python-ldap python-openid pytz pywebdav pyyaml reportlab simplejson vatnumber vobject werkzeug xlwt zsi Beaker MarkupSafe PyXML docutils mock unittest2

Check out code and run OpenERP.
----

    mkdir openerp
    cd openerp
    bzr cat -d lp:~openerp-dev/openerp-tools/trunk setup.sh | sh

check out the code , need long time, you can chose the differt version. run make to get help.

    make init-trunk
    make init-v70
    make init

start the openerp ,and enjoy it, if missing some module cause error,please using pip install those.

    make server

encoding UTF8 does not match locale en_US; the chosen LC_CTYPE setting requires encoding LATIN1
-----
    sudo service postgresql stop
    sudo pg_dropcluster 9.1 --stop main
    sudo pg_createcluster --start -e UTF-8 9.1 main
    sudo service postgresql restart

