Vagrant env manipulations

```
vagrant up
vagrant destroy -f
```


```
ansible nodes -i /vagrant/inventory.ini -m ping -u user -k

ansible nodes -i /vagrant/inventory.ini -m ping

ansible-playbook -i /vagrant/inventory.ini minimal.yaml 

ansible local -m setup

```


