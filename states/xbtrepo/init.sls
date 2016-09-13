
include:
  - nginx
  - nginx.ssl
  - xbtrepo.aptly
  - xbtrepo.kernel

/etc/nginx/conf.d/repo.conf:
  file:
    - managed
    - source: salt://xbtrepo/files/nginx-repo.conf
    - mode: 0600

/var/repo/:
  file:
    - directory
    - mode: 0755
    - user: repo
    - group: repo

/var/repo/.aptly.conf:
  file:
    - managed
    - source: salt://xbtrepo/files/aptly.conf
    - mode: 0644
    - user: repo
    - group: repo

/var/repo/aptly:
  file:
    - directory
    - mode: 0755
    - user: repo
    - group: repo


/var/repo/tmp:
  file:
    - directory
    - mode: 0755
    - user: repo
    - group: repo

/var/repo/images:
  file:
    - directory
    - mode: 0755
    - user: repo
    - group: repo

repo:
  user.present:
    - shell: /bin/bash
    - home: /var/repo
    - uid: 1001
    - gid: 1001
    - require_in:
      - file: /var/repo/
      - file: /var/repo/tmp
      - file: /var/repo/images
      - file: /var/repo/aptly
      - file: /var/repo/.aptly.conf

repo-ssh-keys:
  ssh_auth.present:
    - user: repo
    - enc: ssh-rsa
    - comment: jenkins@build
    - require:
      - user: repo
    - names:
      - 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDB/xfdJ/NGlcdDoWV+tWpW1r+JIfVrsQVeywJbU99ZV88M0ANxDCG6mJprZWfWzxkMmemSDhc50EtoU4FCXyC+775u5LnumuT1nIjOkkVXelQ79ved1VYPKraVf5dBlUdcDylHooqDnVFm4ru22Qkm7pJNP5H/kU9vUwCTIFvv8d+FxTd1uUX0j5aBW4LkAznqL1ZOPxDUZ3ZE4DRbmpKlD7MZqvw7ljOnuiLfbFyXD6za1C4KaJv5XPzjLkexvZBVdIfkEFL/MybrOMOYtkEEv8WmNFAmRay6z47Mw+PjbfQFoDKYziSBW3n2H59qctWUsWZf+uIi1AzmsV2bmqor'
