mysql:
  pkg:
    - installed
    - names: [ mariadb-server, mariadb-client ] 
    - require: [ file: /etc/mysql/my.cnf ]
  service:
    - running
    - enable: True
    - require: [ pkg: mariadb-server  ]

/etc/mysql/my.cnf:
  file:
     - managed
     - source: salt://mysql/my.cnf
     - template: jinja

percona-toolkit:
  pkg:
    - installed
