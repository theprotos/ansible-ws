#!/bin/sh

echo master > /etc/hostname

apk update --no-cache
apk add --no-cache openssh python2 python3 ansible sshpass
apk upgrade musl

mkdir /etc/ansible/
/bin/echo -e "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

#ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa && \
#    cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && \
#    for key in /etc/ssh/ssh_host_*_key.pub; do echo "localhost $(cat ${key})" >> /root/.ssh/known_hosts; done
