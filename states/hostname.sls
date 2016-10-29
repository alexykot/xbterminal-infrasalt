hostnamectl set-hostname {{  grains['id'] }}.xbthq.co.uk:
  cmd:
    - run
    - unless: hostnamectl status | grep {{  grains['id'] }}.xbthq.co.uk
    - require:
      - pkg: dbus

dbus:
  pkg.installed

{{ grains['id'] }}:
  host.present:
    - ip: 127.0.1.1
    - names: [ {{ grains['id'] }}, {{ grains['id'] }}.xbthq.co.uk ]
