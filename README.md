## Updating states ##

Working with states:

push or merge changes to master branch


All states  updated from git via gitfs module

branch = env

master = base env

stage = stage env

dev  = dev env

Current state of states is last commit from selected branch.

Plain(not commited)  states can be placed directly in /srv/salt/states/base rootfs folder.
If state is present in rootfs AND in gitfs, rootfs version of state is preffered.

More information about gitfs backend:

https://docs.saltstack.com/en/latest/topics/tutorials/gitfs.html

## Used formulas ##

* https://github.com/saltstack-formulas/openssh-formula
* https://github.com/saltstack-formulas/ntp-formula
* https://github.com/saltstack-formulas/postgres-formula
* https://github.com/saltstack-formulas/users-formula
* https://github.com/saltstack-formulas/timezone-formula
* https://github.com/saltstack-formulas/php-formula



## Master Server Setup ##

* Setup Salt official repository
* Install packages
```
apt-get install salt-master salt-api salt-cloud python-git nginx
pip install raven

```

* Add jenkins user
```
useradd jenkins
passwd jenkins
```

* Setup rootfs folders
```
mkdir -p /srv/salt/states/base
mkdir -p /srv/salt/states/stage
mkdir -p /srv/salt/states/dev

mkdir -p  /srv/salt/pillars/base
mkdir -p  /srv/salt/pillars/stage
mkdir -p  /srv/salt/pillars/dev

```

* Copy master.example.yml to /etc/salt/master.d/master.conf
* Copy sam.conf to /etc/nginx/conf.d/
* Set private ssh key for prviate repos in .ssh/config
* setup aws provider in /etc/salt/cloud.providers.d/aws.conf
