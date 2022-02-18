#!/bin/bash
grep -l bash\.bashrc /etc/profile || (echo
    echo 'test "$PS1" && test "$BASH" && . /etc/bash.bashrc') |
    tee -a /etc/profile
echo 'type -p -a mc >/dev/null &&
    alias mc=". /usr/share/mc/bin/mc-wrapper.sh"' | tee -a /etc/bash.bashrc
