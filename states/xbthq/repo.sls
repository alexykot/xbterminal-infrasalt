include:
  - xbthq.ca

/etc/apt/apt.conf.d/00ssl-xbt-client-auth:
  file:
    - managed
    - source: salt://xbthq/files/00ssl-xbt-client-auth

/etc/apt/xbt.crt:
  file:
    - managed
    - source: salt://xbthq/files/xbthq-aws-servers.crt

/etc/apt/xbt.key:
  file:
    - managed
    - source: salt://xbthq/files/xbthq-aws-servers.key


/etc/apt/xbt_dev_signing.key:
  file:
    - managed
    - source: salt://xbthq/files/xbt_dev_signing.key


/etc/apt/sources.list.d/xbterminal-backend.list:
  file:
    - managed
    - contents: deb https://repo.xbthq.co.uk/repos/deb/debian/xbterminal-backend/ jessie main
    - require:
      - file: /etc/apt/apt.conf.d/00ssl-xbt-client-auth
      - file: /etc/apt/xbt.crt
      - file: /etc/apt/xbt.key
      - file: /etc/apt/xbt_dev_signing.key
      - cmd: apt-key  add /etc/apt/xbt_dev_signing.key


apt-key  add /etc/apt/xbt_dev_signing.key:
  cmd:
    - wait
    - watch:
      - file: /etc/apt/xbt_dev_signing.key

update-index:
  cmd:
    - wait
    - name: 'apt-get update -qq'
    - watch:
      - file: /etc/apt/apt.conf.d/00ssl-xbt-client-auth
      - file: /etc/apt/xbt.crt
      - file: /etc/apt/xbt.key
      - file: /etc/apt/xbt_dev_signing.key
      - cmd: apt-key  add /etc/apt/xbt_dev_signing.key
