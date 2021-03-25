keepalived_script:
  user.present: []

net.ipv4.ip_nonlocal_bind:
  sysctl.present:
    - value: 1

haproxy:
  pkg.installed: []
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/haproxy/haproxy.cfg
    - require:
      - pkg: haproxy

/etc/haproxy/haproxy.cfg:
 file.managed:
   - source: salt://manager_org_1/load-balancer-config/etc/haproxy/haproxy.cfg
   - mode: 0640
   - user: root
   - group: haproxy
   - create: True
   - makedirs: True

keepalived:
  pkg.installed: []
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/keepalived/keepalived.conf
    - require:
      - pkg: keepalived
      
/etc/keepalived/keepalived.conf:
  file.managed:
   - source: salt://manager_org_1/load-balancer-config/etc/keepalived/keepalived.conf
   - user: root
   - group: root
   - mode: 0640
   - create: True
   - makedirs: True
      