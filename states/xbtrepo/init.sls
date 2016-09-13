
include:
  - nginx
  - nginx.ssl
  - xbtrepo.aptly
  - xbtrepo.kernel

/etc/nginx/conf.d/repo.conf:
  file:
    - managed
    - source: salt://xbtrepo/files/nginx-repo.conf
    - mode: 0600

/var/repo/:
  file:
    - directory
    - mode: 0755
    - user: repo
    - group: repo

/var/repo/.aptly.conf:
  file:
    - managed
    - source: salt://xbtrepo/files/aptly.conf
    - mode: 0644
    - user: repo
    - group: repo

/var/repo/aptly:
  file:
    - directory
    - mode: 0755
    - user: repo
    - group: repo


/var/repo/tmp:
  file:
    - directory
    - mode: 0755
    - user: repo
    - group: repo

/var/repo/images:
  file:
    - directory
    - mode: 0755
    - user: repo
    - group: repo

repo:
  user.present:
    - shell: /bin/bash
    - home: /var/repo
    - uid: 1001
    - gid: 1001
    - require_in:
      - file: /var/repo/
      - file: /var/repo/tmp
      - file: /var/repo/images
      - file: /var/repo/aptly
      - file: /var/repo/.aptly.conf

repo-ssh-keys:
  ssh_auth.present:
    - user: repo
    - enc: ssh-rsa
    - comment: jenkins@build
    - require:
      - user: repo
    - names:
      - 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDZHENkmmqsuPTL7ldWtNFoddtsX8ioz3HmxAg1Zie2biu8+g0cKd6+wwuTY2t9Es7Ehcgr9OYQwLlqGviEauRXc0MUfMO82dRgBlOqIU9SE6hcEYV0n7tILN9euQt3budLBQ+U+zm/vHEJn42gFfbNckHGQfpog59cUa8UHcuEqVwGuEiEgt6HUNJ3lTzCHtKhcE4AFNlkgoXsI/yrPuUjPEsLPvPId2dE0alwdHEGt+sDOny+hfiP9vFjU/T/csG31V/DfQZYzSP6Dzla4PIxHIcxd73tBDB7AFmLLpMBhdtc4XvsloHj+0ORkACIfEH7jvUjDkPjj46l/J2Nctxx'
