{% import_yaml "instances/prod/cloud.yml" as cloud %}
{% set i = cloud.aws.roles.api %}

weblb:
  boto_elb.present:
    - name: 'api-xbt-elb'
    - profile: boto-eu-west-1
    - listeners:
      - elb_port: 443
        instance_port: 8443
        elb_protocol: HTTPS
        instance_protocol: HTTP
        certificate: 'arn:aws:iam::486247037159:server-certificate/xbterminal'
      - elb_port: 80
        instance_port: 8080
        elb_protocol: HTTP
    - subnets:
    {% for az in i.MultiAZ %}
      - {{ az.SubnetId }}
    {% endfor %}
    - health_check:
        target: 'HTTP:8443/en/'
    - attributes:
        cross_zone_load_balancing:
          enabled: True
    - security_groups: {{ i.SecurityGroupId }}
    - wait_for_sync: True

apilb-add-instances:
  boto_elb.register_instances:
    - name: 'api-xbt-elb'
    - profile: boto-eu-west-1
    - instances:
    {% for  id,instance in salt['mine.get']('roles:xbt-api', 'instance_id', expr_form='grain') | dictsort %}
      - {{ instance }}
    {% endfor %}