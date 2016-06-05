{% from "nginx/map.jinja" import nginx with context %}

/etc/nginx/ssl/ca.crt:
  file:
    - managed
    - source: salt://xbthq/files/xbthq.root.crt
    - mode: 0600


/etc/nginx/{{ nginx.config.ssl.domain  }}.client.conf:
  file:
    - managed
    - source: salt://sentry/files/nginx.client.conf
    - mode: 0600
