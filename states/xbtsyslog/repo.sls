syslog-ng-repo:
  pkgrepo.managed:
    - humanname: Syslog-ng repositories
    - name: deb http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_8.0 ./
    - file: /etc/apt/sources.list.d/syslog-ng-obs.list
    - key_url: https://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_8.0/Release.key
