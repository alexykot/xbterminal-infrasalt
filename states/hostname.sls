hostnamectl set-hostname {{  grains['id'] }}.xbthq.co.uk:
  cmd:
    - run
    - require:
      - pkg: dbus

dbus:
  pkg.installed

system:
    network.system:
      - enabled: True
      - hostname: {{  grains['id'] }}.xbthq.co.uk


{{ grains['id'] }}:
  host.present:
    - ip: 127.0.1.1
    - names: [ {{ grains['id'] }}, {{ grains['id'] }}.xbthq.co.uk ]



