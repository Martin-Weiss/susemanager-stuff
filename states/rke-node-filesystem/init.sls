rescan-scsi-bus:
  cmd.run:
    - name: /usr/bin/rescan-scsi-bus.sh -a -s

/dev/disk/by-path/pci-0000:03:00.0-scsi-0:0:1:0:
  blockdev.formatted:
    - fs_type: xfs
    - require:
      - cmd: rescan-scsi-bus
    - onlyif:
      - test -b /dev/disk/by-path/pci-0000:03:00.0-scsi-0:0:1:0

/var/lib/rancher:
  mount.mounted:
    - device: /dev/disk/by-path/pci-0000:03:00.0-scsi-0:0:1:0
    - fstype: xfs
    - mkmnt: True
    - opts:
      - defaults
    - onlyif:
      - test -b /dev/sdb

/dev/disk/by-path/pci-0000:03:00.0-scsi-0:0:2:0:
  blockdev.formatted:
    - fs_type: xfs
    - require:
      - cmd: rescan-scsi-bus
    - onlyif:
      - test -b /dev/disk/by-path/pci-0000:03:00.0-scsi-0:0:2:0

/var/lib/longhorn:
  mount.mounted:
    - device: /dev/disk/by-path/pci-0000:03:00.0-scsi-0:0:2:0
    - fstype: xfs
    - mkmnt: True
    - opts:
      - defaults
    - onlyif:
      - test -b /dev/disk/by-path/pci-0000:03:00.0-scsi-0:0:2:0