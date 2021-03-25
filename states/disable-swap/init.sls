stop-swap:
  cmd.run:
    - name: swapoff -a

swap:
    mount.fstab_absent:
      - fs_file: swap
      - mount_by: uuid

swap-target-stop:
    service.dead:
     - name: swap.target

swap-sda3-stop:
    service.dead:
     - name: dev-sda3.swap
    
swap-target-disable:
    service.disabled:
     - name: swap.target

swap-sda3-disable:
    service.disabled:
     - name: dev-sda3.swap

/dev/sda3:
  blockdev.formatted:
   - fs_type: xfs
   - force: true