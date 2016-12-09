{% from "nginx/map.jinja" import nginx with context %}

gendhparam:
  cmd:
    - run
    - name: openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048
    - creates: /etc/nginx/ssl/dhparam.pem
    - require:
      - file: /etc/nginx/ssl/

/etc/nginx/ssl/:
  file:
    - directory
    - makedirs: True


/etc/nginx/{{ nginx.config.ssl.domain }}.ssl.conf:
  file:
    - managed
    - source: salt://nginx/files/ssl.conf
    - mode: 0600
    - template: jinja
    - context:
      config: {{ nginx.config }}


/etc/nginx/ssl/{{ nginx.config.ssl.domain }}/{{ nginx.config.ssl.domain }}.key:
  file:
    - managed
    - makedirs: true
    - mode: 0600
    - contents_pillar: nginx:config:ssl:key
    - show_changes: False


/etc/nginx/ssl/{{ nginx.config.ssl.domain }}/{{ nginx.config.ssl.domain }}.crt:
  file:
    - managed
    - mode: 0600
    - template: jinja
    - makedirs: true
    - contents_pillar: nginx:config:ssl:crt
    - show_changes: False
