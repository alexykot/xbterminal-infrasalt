## Updating states and pillars  ##

Working with states:

push or merge changes to master branch


All states  updated from git via gitfs module

branch = env

master = base env

stage = stage env

dev  = dev env

Current state of states is last commit from selected branch.

Plain(not commited)  states can be placed directly in developer's home folder: **/home/<username>/states/**.
If state is present in rootfs AND in gitfs, rootfs version of state is preffered.

Pillars always use git version

More information about gitfs backend:

https://docs.saltstack.com/en/latest/topics/tutorials/gitfs.html

## Encrypting secrets in pillars ##

All secrets(passwords, private keys) in pillars should be encrypted.

* Install gpg
* Install public key ```gpg --import xbterminal-infrasalt/xbtip.pub```
* Encrypt pillar values with gpg:
```echo -n "supersecret" | gpg —armor —batch —trust-model always —encrypt -r xbtip```
* Add special pillar renderer on top of pillar file ```#!yaml|gpg```
* Set pillar value to gpg message:

```
#!yaml

#!yaml|gpg

user: 'root'
password: |
  -----BEGIN PGP MESSAGE-----
  Version: GnuPG v2
  hQEMA/XI2iCydQqJAQgA2BD83/D45NVqxF1CYc2YGDNuq6LdgWdtkBaR4v1VokvD
  .....
  =1iKF
  -----END PGP MESSAGE-----
```

Some editors provide plugins for simple encrypting selected parts of text:

* Atom: https://github.com/jpohjolainen/atom-gpg
* Geany: https://plugins.geany.org/geanypg.html

Gpg renderer provide this functionality
https://docs.saltstack.com/en/latest/ref/renderers/all/salt.renderers.gpg.html


## Used formulas ##

* https://github.com/saltstack-formulas/openssh-formula
* https://github.com/saltstack-formulas/ntp-formula
* https://github.com/saltstack-formulas/postgres-formula
* https://github.com/saltstack-formulas/users-formula
* https://github.com/saltstack-formulas/timezone-formula
* https://github.com/saltstack-formulas/php-formula
* https://github.com/maratsh/systemd-formula
* https://github.com/maratsh/mongodb-formula



## Master Server Setup ##

* Setup Salt official repository
* Install packages

```
apt-get install salt-master salt-api salt-cloud python-git nginx gpg
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
* Setup or copy gpg keys to /etc/salt/gpgkeys
