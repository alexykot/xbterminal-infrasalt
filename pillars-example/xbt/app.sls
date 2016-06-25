postfix:
  config:
    relay:
      host: 'email-smtp.eu-west-1.amazonaws.com'
      port: 587
      user: 'e.g. aws id'
      password: 'e.g. aws key'

xbt:
  app:
    version: '>1'
    config:
      ALLOWED_HOSTS:
        - '*'
      RAVEN_CONFIG:
        dsn: 'http://db0:xyz@sentry.xbthq.int/7'


      AWS_STORAGE_BUCKET_NAME: 'xbt-storage-prod'
      AWS_ACCESS_KEY_ID: 'xyz'
      AWS_SECRET_ACCESS_KEY: 'xyz'

      RECAPTCHA_PRIVATE_KEY: '6Le0VwUTAAAAAN1GLkUSgwOkcmYFRJ8wdnOAIxiX'
      RECAPTCHA_PUBLIC_KEY: '6Le0VwUTAAAAAMKDoyCdgNolg2v-XbKKlD9LKVqj'

      EMAIL_HOST: 127.0.0.1
      EMAIL_PORT: 25
      EMAIL_HOST_USER: no-reply@xbterminal.io
      EMAIL_HOST_PASSWORD:
      EMAIL_USE_TLS: False
      DEFAULT_FROM_EMAIL: no-reply@xbterminal.io

      SESSION_COOKIE_SECURE: True
      CSRF_COOKIE_SECURE: True

      PKI_KEY_FILE: 'xbterminal_io_2015.key'
      PKI_CERTIFICATES:
        - 'xbterminal_io_2015.pem'
        - 'COMODORSADomainValidationSecureServerCA.pem'
        - 'COMODORSAAddTrustCA.pem'
        - 'AddTrustExternalCARoot.pem'

      DATABASES:
        default:
          ENGINE: 'django.db.backends.postgresql_psycopg2'
          NAME: 'xbterminal'
          USER: 'xbterm_usr'
          PASSWORD: 'xyz'
          HOST: '172.90.204.11'
          PORT: 5432

      BITCOIND_SERVERS:
        mainnet:
          HOST: 54.229.125.109
          USER: xbterminal
          PASSWORD: 'xyz'
        testnet:
          HOST: node.xbterminal.io
          USER: user
          PASSWORD: password

      SALT_SERVERS:
        default:
          HOST: https://sam.xbthq.co.uk/
          USER: salt-xbt-prod
          PASSWORD: xyz
          CLIENT_CERT: client/server.crt
          CLIENT_KEY: client/server.key
          CA_CERT: xbthq.crt

      APTLY_SERVERS:
        default:
          HOST: https://repo.xbthq.co.uk/
          CLIENT_CERT: client/server.crt
          CLIENT_KEY: client/server.key
          CA_CERT: xbthq.crt

      CACHES:
         default:
           BACKEND: 'django_redis.cache.RedisCache'
           LOCATION: 'redis://127.0.0.1:6379/0'
           OPTIONS:
             CLIENT_CLASS: 'django_redis.client.DefaultClient'

      RQ_QUEUES:
        low:
          URL: 'redis://172.90.205.31:6379/1'
        high:
          URL: 'redis://172.90.205.31:6379/1'

      TIME_ZONE: 'Europe/London'

systemd:
    tasks:
      -  name: xbterminal-send_reconciliation
         unit:
           - Description = xbterminal-send_reconciliation
         service:
           - ExecStart=/bin/bash -c "cd /var/www/xbterminal.com && . venv/bin/activate && python xbterminal/manage.py send_reconciliation"
           - Restart=no
           - LimitNOFILE=8192
           - User=xbt-app
         install: []
         timer:
           - OnUnitInactiveSec=5m
      -  name: xbterminal-check_kyc
         unit:
           - Description = xbterminal-check_kyc
         service:
           - ExecStart=/bin/bash -c "cd /var/www/xbterminal.com && . venv/bin/activate && python xbterminal/manage.py check_kyc"
           - Restart=no
           - LimitNOFILE=8192
           - User=xbt-app
         install: []
         timer:
           - OnUnitInactiveSec=2h
      -  name: xbterminal-check_wallet
         unit:
           - Description = xbterminal-check_wallet
         service:
           - ExecStart=/bin/bash -c "cd /var/www/xbterminal.com && . venv/bin/activate && python xbterminal/manage.py check_wallet"
           - Restart=no
           - LimitNOFILE=8192
           - User=xbt-app
         install: []
         timer:
           - OnUnitInactiveSec=30m
