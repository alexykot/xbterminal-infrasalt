{% import_yaml "instances/infra/cloud.yml" as cloud %}
{% set i = cloud.aws.roles.syslog %}

{% for noma in range(1, i.count +1 ) %}

{{ i.name }}-0{{ noma }}:
  cloud.present:
    - cloud_provider: aws
    - size: {{ i.size }}
    - ssh_username: {{ cloud.aws.ssh_username }}
    - image: {{ cloud.aws.ami }}
    - del_all_vols_on_destroy:  {{ cloud.aws.del_all_vols_on_destroy }}
    - volumes: {{ i.volumes }}
    - tag: {'Env': 'infra', 'Roles': 'xbt-syslog', 'Name': '{{ i.name }}-0{{ noma }}'}
    - sync_after_install: {{ cloud.aws.sync_after_install }}
    - network_interfaces:
      - DeviceIndex: 0
        PrivateIpAddress: {{ i.Subnet24 }}6{{ noma }}
        AssociatePublicIpAddress: True
        SubnetId: {{ i.SubnetId }}
        SecurityGroupId: {{ i.SecurityGroupId }}
    - minion: { 'grains': { 'roles': [ 'xbt-syslog' ] } }


{{ i.name }}-0{{ noma }} - highstate:
  salt.state:
    - tgt: {{ i.name }}-0{{ noma }}
    - highstate: True
    - require:
      - cloud: {{ i.name }}-0{{ noma }}
{% endfor %}
