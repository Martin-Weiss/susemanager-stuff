rescan-scsi-bus:
  cmd.run:
    - name: /usr/bin/rescan-scsi-bus.sh -a -s

/dev/sdb:
  blockdev.formatted:
    - fs_type: btrfs
    - require:
      - cmd: rescan-scsi-bus
    - onlyif:
      - test -b /dev/sdb

/var/lib/containers:
  mount.mounted:
    - device: /dev/sdb
    - fstype: btrfs
    - mkmnt: True
    - opts:
      - defaults
    - onlyif:
      - test -b /dev/sdb

/dev/sdc:
  lvm.pv_present:
    - require:
      - cmd: rescan-scsi-bus
    - onlyif:
      - test -b /dev/sdc

data_vg:
  lvm.vg_present:
    - name: data
    - devices: /dev/sdc

data_lv:
  lvm.lv_present:
    - name: data
    - vgname: data
    - size: 40G

nfs_lv:
  lvm.lv_present:
    - name: nfs
    - vgname: data
    - size: 10G

remote_lv:
  lvm.lv_present:
    - name: remote
    - vgname: data
    - size: 10G

/dev/data/data:
  blockdev.formatted:
    - fs_type: xfs

/dev/data/nfs:
  blockdev.formatted:
    - fs_type: xfs

/dev/data/remote:
  blockdev.formatted:
   - fs_type: xfs
   
/data:
  file.directory

/data_mount:
  mount.mounted:
    - name: /data
    - device: /dev/data/data
    - fstype: xfs
    - mkmnt: True
    - opts:
      - defaults
      
/srv/nfs:
  mount.mounted:
    - device: /dev/data/nfs
    - fstype: xfs
    - mkmnt: True
    - opts:
      - defaults

/var/log/remote:
  mount.mounted:
    - device: /dev/data/remote
    - fstype: xfs
    - mkmnt: True
    - opts:
      - defaults
