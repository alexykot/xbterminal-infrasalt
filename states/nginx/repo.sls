nginx-official-repo:
  pkgrepo.managed:
    - humanname: nginx repo
    - name: deb http://nginx.org/packages/debian/ jessie nginx
    - file: /etc/apt/sources.list.d/nginx-official-jessie.list
    - require:
      - cmd: add_nginx_key

add_nginx_key:
  cmd:
    - wait
    - name:  apt-key add /etc/apt/nginx_signing.key
    - watch:
      - file: /etc/apt/nginx_signing.key


/etc/apt/nginx_signing.key:
  file:
    - managed
    - source: salt://nginx/files/nginx_signing.key