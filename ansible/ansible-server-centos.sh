#!/bin/sh

echo master > /etc/hostname

yum update
yum install -y openssh python2 python3 ansible sshpass

yum clean all

# mkdir /etc/ansible/
/bin/echo -e "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

export ANSIBLE_HOST_KEY_CHECKING=False
