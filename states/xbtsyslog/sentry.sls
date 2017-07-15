libpython2.7:
  pkg:
    - installed

python-raven:
  pkg:
    - installed
    - version: 6.1.0-1

sng2sentry:
  file:
    - managed
    - name:  '/usr/local/share/syslog-ng/python/sng2sentry.py'
    - mode: 0600
    - user: root
    - group: root
    - makedirs: True
    - source: salt://xbtsyslog/files/sng2sentry.py
