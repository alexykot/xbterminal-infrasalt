uwsgi:
  # These are usually set by grains in map.jinja
  lookup:
    server_pkg: 'uwsgi'
    pip: 'uwsgi'
    plugins:
      - uwsgi-plugin-python

  package:
    opts: {} # this partially exposes parameters of all pkg.installed used

  # application in the uwsgi server default it will be places in app_available
  applications:
    managed:
      xbterminal.ini: # relative pathname of the application file
        # may be True, False, or None where True is enabled, False, disabled, and None indicates no action
        enabled: True

        # May be a list of config options or None, if None, no vhost file will be managed/templated
        config:
          vhost: true
          host: xbterminal.io
          uid: 'xbt-app'
          gid: 'xbt-app'
          socket: '127.0.0.1:8000'
          plugin: 'python2'
          home: /var/www/xbterminal.com/venv
          chdir: '/var/www/xbterminal.com/xbterminal'
          processes:  2
          module: 'xbterminal.uwsgi'
          chmod-socket: 660
          enable-threads: True
          vacuum: True
