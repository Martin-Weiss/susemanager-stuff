nfs-kernel-server:
  pkg.installed: []
  service.running:
    - name: nfsserver
    - enable: True
    - reload: True
    - watch:
      - file: /etc/exports
    - require:
      - pkg: nfs-kernel-server

/etc/exports:
 file.managed:
   - source: salt://manager_org_1/nfs-server/etc/exports
   - mode: 0644
   - user: root
   - group: root
   - create: True
   
/srv/nfs/rke-test:
  file.directory
  
/srv/nfs/rke-int:
  file.directory
  
/srv/nfs/rke-prod:
  file.directory
  
/srv/nfs/rancher:
  file.directory