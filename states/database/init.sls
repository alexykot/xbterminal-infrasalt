include:
  - postgres
  - database.datadisk



extend:
  install-postgresql-repo:
    pkgrepo:
      - require:
        - mount: mount-datadisk

