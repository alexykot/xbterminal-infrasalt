{% set db = pillar['database'] %}

duplicity:
  pkg:
    - installed

/etc/cron.d/backup:
  file:
    - managed
    - contents: |
        MAILTO=""
        MAILFROM=""
        1 1 * * *  root /bin/bash /var/backups/xbt/backup.sh inc 2>&1 | tee -a /var/log/backup.log |  logger -p info -t backup.inc  -s
        1 3 10 * * root /bin/bash /var/backups/xbt/backup.sh full 2>&1 | tee -a /var/log/backup.log |  logger -p info -t backup.full  -s


/var/backups/xbt/backup.sh:
  file:
    - managed
    - source: salt://database/files/backup.sh
    - template: jinja
    - mode: 0600
    - dir_mode: 0755
    - makedirs: True
    - user: root
    - context:
      b: {{ db.backup }}

/var/backups/xbt/postgres:
  file:
    - directory
    - user: postgres
    - group: postgres
    - makedirs: True