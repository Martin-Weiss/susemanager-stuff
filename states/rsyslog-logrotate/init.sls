/etc/logrotate.d/remote:
 file.managed:
   - source: salt://manager_org_1/rsyslog-logrotate/etc/logrotate.d/remote
   - mode: 0644
   - user: root
   - group: root
   - create: True
   
/etc/rsyslog.d/remote.conf:
 file.managed:
   - source: salt://manager_org_1/rsyslog-logrotate/etc/rsyslog.d/remote.conf
   - mode: 0600
   - user: root
   - group: root
   - create: True

rsyslog:
  pkg.installed: []
  service.running:
    - name: rsyslog
    - enable: True
    - reload: True
    - watch:
      - file: /etc/rsyslog.d/remote.conf