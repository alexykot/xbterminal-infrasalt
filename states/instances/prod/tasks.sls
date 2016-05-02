{% import_yaml "instances/prod/cloud.yml" as cloud %}
{% set i = cloud.aws.roles.tasks %}

{% for noma in range(1, i.count +1 ) %}

{{ i.name }}-0{{ noma }}:
  cloud.present:
    - cloud_provider: aws
    - size: {{ i.size }}
    - ssh_username: {{ cloud.aws.ssh_username }}
    - image: {{ cloud.aws.ami }}
    - del_all_vols_on_destroy:  {{ cloud.aws.del_all_vols_on_destroy }}
    - tag: {'Env': '{{ cloud.env  }}', 'Roles': 'xbt-tasks', 'Name': '{{ i.name }}-0{{ noma }}'}
    - sync_after_install: grains
    - network_interfaces:
      - DeviceIndex: 0
        PrivateIpAddress: {{ i.Subnet24 }}{{ noma }}
        AssociatePublicIpAddress: True
        SubnetId: {{ i.SubnetId }}
        SecurityGroupId: {{ i.SecurityGroupId }}
    - minion: { 'grains': { 'roles': [ 'xbt-tasks' ] } }

{{ i.name }}-0{{ noma }} - highstate:
  salt.state:
    - tgt: {{ i.name }}-0{{ noma }}
    - highstate: True
    - require:
      - cloud: {{ i.name }}-0{{ noma }}
{% endfor %}