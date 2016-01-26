nginx-official-repo:
  pkgrepo.managed:
    - humanname: nginx repo
    - name: deb http://nginx.org/packages/debian/ jessie nginx
    - file: /etc/apt/sources.list.d/nginx-official-jessie.list
