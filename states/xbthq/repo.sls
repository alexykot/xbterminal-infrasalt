include:
  - xbthq.ca

/etc/apt/apt.conf.d/00ssl-xbt-client-auth:
  file:
    - managed
    - source: salt://xbthq/files/00ssl-xbt-client-auth

/etc/apt/xbt.crt:
  file:
    - managed
    - mode: 0600
    - show_changes: False
    - contents_pillar: xbthq:repo:crt

/etc/apt/xbt.key:
  file:
    - managed
    - mode: 0600
    - show_changes: False
    - contents_pillar: xbthq:repo:key



/etc/apt/xbt_dev_signing.key:
  file:
    - managed
    - show_changes: False
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

check-update-ability:
  cmd:
    - run
    - name: 'apt-get update -qq 2>&1 | grep -c "W: Some index files failed to download. They have been ignored, or old ones used instead." |  grep 0'
    - watch:
      - file: /etc/apt/apt.conf.d/00ssl-xbt-client-auth
      - file: /etc/apt/xbt.crt
      - file: /etc/apt/xbt.key
      - file: /etc/apt/xbt_dev_signing.key
      - cmd: apt-key  add /etc/apt/xbt_dev_signing.key
