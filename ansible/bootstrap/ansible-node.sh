#!/bin/sh

echo "I am a node" > /root/node.txt
#sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
#systemctl restart sshd.service

rm -rf /home/vagrant/.ssh/id_rsa

