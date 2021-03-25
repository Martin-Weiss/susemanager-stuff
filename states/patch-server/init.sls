patch-server:
  pkg.uptodate:
    - refresh : True
    - unless:
      - rpm -q skuba-update

reboot-after-patch:
 module.run:
   - name: system.reboot
   - at_time: 1
   - onlyif:
     - "! rpm -q skuba-update"
     - "! pidof rke2"
   - unless:
     - zypper needs-rebooting