#!/bin/bash

#       ALIAS



cat << EOF >>  ~/.bashrc


alias ll='ls -alF --time-style=long-iso -r -h '
alias add="apt-get -y install"
alias update="apt-get update -qq  && apt-get  -y upgrade -qq  && apt-get  -y dist-upgrade -qq "

alias remove="apt-get -y remove"
alias search="apt-cache search"
alias purge="apt-get -y purge"
alias tailf="tail -f "
alias error="tailf /var/log/apache2/error.log"
alias access="tailf /var/log/apache2/access.log"
alias work="cd /var/www/html"
alias grep='grep -i'


EOF



#       UPDATE && UPGRADE


apt-get update -qq  && apt-get  -y upgrade -qq  && apt-get  -y dist-upgrade

# Install MC

apt-get -y install mc
#
#    MC exit directory
#

grep -l bash\.bashrc /etc/profile || (echo
    echo 'test "$PS1" && test "$BASH" && . /etc/bash.bashrc') |
    tee -a /etc/profile
echo 'type -p -a mc >/dev/null &&
    alias mc=". /usr/share/mc/bin/mc-wrapper.sh"' | tee -a /etc/bash.bashrc


clear

echo "!!!!!!        DONE  !!!!" 

echo "              :)"

# init 6
