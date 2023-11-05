#!/bin/bash

# remove files
rm -rf  /usr/share/doc
rm -rf /usr/share/man
rm -rf /usr/share/groff
rm -rf  /usr/share/info
rm -rf /usr/share/lintian
rm -rf  /usr/share/linda
rm -rf  /var/cache/man

# change configuration
#echo "set man-db/auto-update false" | debconf-communicate; dpkg-reconfigure man-db
