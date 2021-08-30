#!/bin/bash
echo "                          add       ALIAS"
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

echo "                                 ENABLE SSH access "
sed -i 's/#PermitRootLogin prohibit-password/#PermitRootLogin Yes/g' /etc/ssh/sshd_config
systemctl restart sshd
echo "Install SSH Key"
mkdir /root/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3VnUdbtFBzjFxOOHGm/nF4pJ/MWbScK4z3kFvA64z1spkJaBzCrnzPjejnawRL4v2g0Zi/50aa0ywEW91saakkjogndXezjFFL1CPE5xOy9tbZjOjbWqxMfmdvtRWbLwUfzPsnDH0viFZkDxtj4e4j88TjJapbFPEQX8JhFqDYjvx5RZjAEl4GCqpaTbzFvYOqX+68Ob7rP4cosogKyGZS0wcLpDMeTzx8bf3bN1EVKoV2ekya7V7ZhTyogYWfaINAmc4/Q7bitfiyWHAd9Cp5LSiAKMwBJJZgb3hPQKHTtiDR1Veek2XPLNQ+ap0oWg5ELhxHW4vNJAAeQ9uF5RP root@gao.lt"  >> /root/.ssh/authorized_keys
echo "             UPDATE && UPGRADE "
apt-get update -qq  && apt-get  -y upgrade -qq  && apt-get  -y dist-upgrade > /dev/null 2>&1
echo "REMOVE Apparmor"
echo " Cleap Up"
apt-get -y autoremove
apt-get autocliena
aa-teardown
systemctl stop apparmor
systemctl  disable apparmor
update-rc.d -f apparmor remove
apt-get -y remove  apparmor apparmor-utils
echo "Install Hyper-V Guest Tools"
cat << EOF >> /etc/initramfs-tools/modules
hv_vmbus
hv_storvsc
hv_blkvsc
hv_netvsc
EOF
apt-get -y install linux-virtual linux-cloud-tools-virtual linux-tools-virtual > /dev/null 2>&1
update-initramfs -u

echo "                            Install Midnight Commander"

apt-get -y install mc

echo "Change MC to use Unternal Editor"
mkdir -p /root/.config/mc
echo "use_internal_edit=true" >> /root/.config/mc/ini
echo " fix MC exit directory"


grep -l bash\.bashrc /etc/profile || (echo
    echo 'test "$PS1" && test "$BASH" && . /etc/bash.bashrc') |
    tee -a /etc/profile
echo 'type -p -a mc >/dev/null &&
    alias mc=". /usr/share/mc/bin/mc-wrapper.sh"' | tee -a /etc/bash.bashrc

clear

echo "!!!!!!        DONE  !!!!"

echo "      ENJOY !        :)"
ip a  s

echo "init 6"
