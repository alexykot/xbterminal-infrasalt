{% from "xbtsam/map.jinja" import xbtsam with context %}

include:
  - nginx

/etc/nginx/conf.d/{{ xbtsam.api.domain }}.conf:
  file:
    - managed
    - source: salt://xbtsam/files/apinginx.conf
    - mode: 0600
    - template: jinja
    - context:
      api: {{ xbtsam.api }}
