Influxdb role
============

This role manages Influxdb installation.

Key Variables
-------------

Notes
-------------
Influxdb use JWT key to write successful deploy commit into InfluxDB  https://git.ab.duok5.tv/advbet/ansible-advbet/src/branch/master/roles/gitea/files

   [root@ops-influx01 influxdb]# python3 -m pip install python-jose

   [root@ops-influx01 influxdb]# python3
   Python 3.6.8 (default, Mar 19 2021, 05:13:41) 
   [GCC 8.4.1 20200928 (Red Hat 8.4.1-1)] on linux
   Type "help", "copyright", "credits" or "license" for more information.
   >>> from jose import jwt
   >>> key = 'k6msdLnco87rpNqR59mHleO5M9rlgPm5nd43'  
   >>> encoded = jwt.encode({ "username": "root", "exp": 1915091246}, key, algorithm="HS256")
   >>> print(encoded)
   eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJvb3QiLCJleHAiOjE5MTUwOTEyNDZ9.Wc0nWQivD8ImaM_grIjTr0_OOoke4eTtZipAur9lMz4
   >>> 

More info https://docs.influxdata.com/influxdb/v1.8/administration/authentication_and_authorization/
Tags
---

* `influxdb`
