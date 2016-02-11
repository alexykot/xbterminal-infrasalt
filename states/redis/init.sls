include:
  - xbthq.repo


redis-package:
  pkg:
    - installed
    - refresh: True
    - pkgs:
      - redis-server
      - redis-tools
    - require:
      - file: /etc/apt/sources.list.d/xbterminal-backend.list

redis-service:
  service:
    - running
    - name: redis
    - enable: True
    - require:
      - pkg: redis-package
    - watch: [ file: /etc/redis/redis.conf ]

redis-config:
  file:
    - managed
    - name: /etc/redis/redis.conf
    - source: salt://redis/files/redis.conf
    - template: jinja
