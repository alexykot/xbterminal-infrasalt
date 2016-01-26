include:
  - nginx.repo

nginx:
  pkg:
    - installed
    - require:
      - pkgrepo: nginx-official-repo
  service:
    - running
    - enable: True
    - backup: minion
    - watch:
      - file: /etc/nginx/*
      - file: /etc/security/limits.conf

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/files/nginx.conf
    - template: jinja

/etc/nginx/conf.d/default.conf:
  file.managed:
    - source: salt://nginx/files/default.conf

/etc/security/limits.conf:
  file.append:
    - text:
      - nginx soft nproc 20000
      - nginx hard nproc 20000
      - nginx soft nofile 20000
      - nginx hard nofile 20000
 

