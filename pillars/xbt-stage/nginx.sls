nginx:
  install_from_source: False
  use_upstart: False
  use_sysvinit: False
  use_systemd: True
  user_auth_enabled: True
  with_luajit: False
  with_openresty: False
  official: True
  repo_source: official
  use_official: True
  use_ppa: False
  lookup:
    package: nginx
    error_log:
      location: '/var/log/nginx/error.log'
      level: 'warn'     
