{% import_yaml "instances/prod/cloud.yml" as cloud %}
{% set i = cloud.aws.roles.rds_postgresql %}
{% set database = pillar['xbt']['app']['config']['DATABASES']['default'] %}

rds_postgresql:
  boto_rds:
    - present
    - profile: boto-eu-west-1 #minion-side defined
    - name: {{ i.name }}
    - allocated_storage: {{ i.volume }}
    - db_instance_class: {{ i.size }}
    - engine: postgres
    - master_username: {{ database.NAME }}
    - master_user_password:  {{ database.PASSWORD }}
    - db_subnet_group_name: {{ i.MultiAZ.SubnetDBID }}
    - multi_az: True
    - engine_version: 9.5.2
    - auto_minor_version_upgrade: True
    - publicly_accessible: False
    - wait_status: available
    - vpc_security_group_ids: {{ i.SecurityGroupId }}
    - tags:
      -
        - Env
        - {{ cloud.env  }}
    - require:
      - boto_rds: rds-postgresql-subnet

rds-postgresql-subnet:
  boto_rds:
    - profile: boto-eu-west-1
    - subnet_group_present
    - name: {{ i.MultiAZ.SubnetDBID }}
    - subnet_ids: {{ i.MultiAZ.SubnetIDs }}
    - description: subnet for {{ i.name }}
    - tags:
      -
        - Env
        - {{ cloud.env  }}
