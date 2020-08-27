https://wiki.centos.org/HowTos/Virtualization/VirtualBox

```
cd /etc/yum.repos.d
wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo

yum update

yum --enablerepo=epel       install -y dkms
yum --enablerepo=virtualbox install -y VirtualBox-6.1

usermod -a -G vboxusers <username>
```
