
include:
  - nginx
  - nginx.ssl
  - xbtrepo.aptly

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
