#!/bin/bash
dnf install python38 python38-pip -y;
dnf install python38-psycopg2.x86_64 python38-asn1crypto python38-babel.noarch python38-cffi python38-idna  python38-markupsafe python38-ply python38-pycparser python38-pytz.noarch python38-pyyaml -y;
python3.8 -m venv /var/lib/awx/venv/python38
/var/lib/awx/venv/python38/bin/python -m pip install pip -U
#python3 -m pip   freeze > /tmp/pip_freeze.txt
# Edit  /tmp/pip_freeze.txt  no versions, comment rpm, selinux, gpg, ansible, psycopg2
#/var/lib/awx/venv/python38/bin/python -m pip install -r /tmp/pip_freeze.txt
#/var/lib/awx/venv/python38/bin/python -m pip install psutil bcrypt cryptography Jinja2 jmespath paramiko pyasn1 PyNaCl python-dateutil six supervisor virtualenv
/var/lib/awx/venv/python38/bin/python -m pip install psutil==5.8.0 bcrypt==3.2.0 cryptography==3.4.7 Jinja2==2.11.3 jmespath==0.10.0 paramiko==2.7.2 pyasn1==0.4.8 PyNaCl==1.4.0 python-dateutil==2.8.1 six==1.15.0 supervisor==4.2.2 virtualenv==20.4.4 netaddr hcloud boto3 zabbix_api dnspython influxdb
/var/lib/awx/venv/python38/bin/python -m pip install ansible==3.4.0 ansible-base==2.10.10
