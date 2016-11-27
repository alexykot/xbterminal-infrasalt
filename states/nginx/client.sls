{% from "nginx/map.jinja" import nginx with context %}

/etc/nginx/ssl/ca.crt:
  file:
    - managed
{% if nginx.config.ssl.ca is defined %}
    - contents_pillar: nginx:config:ssl:ca
{% else %}
    - source: salt://xbthq/files/xbthq.root.crt
{% endif %}
    - mode: 0600


/etc/nginx/{{ nginx.config.ssl.domain  }}.client.conf:
  file:
    - managed
    - source: salt://sentry/files/nginx.client.conf
    - mode: 0600
