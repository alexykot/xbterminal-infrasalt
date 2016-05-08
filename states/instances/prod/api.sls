{% import_yaml "instances/prod/cloud.yml" as cloud %}
{% from "xbtapp/map.jinja" import app with context %}

{% set i = cloud.aws.roles.api %}

xbt_api_highstate:
  salt.state:
    - tgt: 'roles:xbt-api'
    - tgt_type: grain
    - highstate: True
    - saltenv: base
    - require:
      - cloud: 'xbt*'

{% for zone in i.MuiltiAZ %}
{% for noma in range(1, zone.count +1 ) %}

{% endfor %}
{% endfor %}

{% for zone in i.MuiltiAZ %}
{% for noma in range(1, zone.count +1 ) %}


{{ i.name }}-{{ zone.id }}-0{{ noma }}:
  cloud.present:
    - cloud_provider: aws
    - size: {{ i.size }}
    - ssh_username: {{ cloud.aws.ssh_username }}
    - image: {{ cloud.aws.ami }}
    - del_all_vols_on_destroy:  {{ cloud.aws.del_all_vols_on_destroy }}
    - tag: {'Env': '{{ cloud.env  }}', 'Roles': 'xbt-api', 'Name': '{{ i.name }}-{{ zone.id }}0{{ noma }}'}
    - sync_after_install: grains
    - network_interfaces:
      - DeviceIndex: 0
        PrivateIpAddress: {{ zone.Subnet24 }}{{ noma }}
        AssociatePublicIpAddress: True
        SubnetId: {{ zone.SubnetId }}
        SecurityGroupId: {{ i.SecurityGroupId }}
    - minion: { 'grains': { 'roles': [ 'xbt-api' ] } }

{% endfor %}
{% endfor %}
