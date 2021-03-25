rkeadmin_group:
 group.present:
   - name: rkeadmin
   - gid: 10010
rkeadmin_user:
 user.present:
   - name: rkeadmin
   - uid: 10010
   - gid: 100
   - home: /home/rkeadmin
   - createhome: true
   - password: $1$BKOauhvj$OQWgKyklPj3oqTasQzxRq.
   - groups:
      - rkeadmin
# ssh-key of root on susemanager
AAAAB3NzaC1yc2EAAAADAQABAAABgQD1RPbAISjVatORw9QZjLPS4h++Noq/6haXnaZjtsmQNiqVaq3v4zUTaEolrow8/fTKIwIDxLbtUyy8Y/AbDoCp3dT2fx1YCw2BCpg1fn4QxBzc7NAxA+XrUty53PZ3V2AhpJgoN5Iybjkvo0xguiPjo/W62ZRTtNssodRr/nMnwos4/Xb1VvLe5sIQIkHuLQvp9TdBJtUhf3H/zw4tiwGrI6FN6B02Q1DVAntX8BMcq0pjgF2Gd6QV1L1CTz+H+IIeevALWzJG+AeQmXE7psRPpqgMYBof2bNTTYUjpau+8/plVBoHJZCxABPALUYDGwu/m6iPdjhMFH7jxXPBaseDgTDLWthAV/4j7il2o2xVjjsJ0IfShiOvx10BIBfkAR20NLQ9ptQkHki5/TdTEDO7H9R2Sd9ktWtOaylTXXoES1cqLN/cl1VJ8oXxc+ehFFyFdCumTQKRNEPoTdXYsfMVCPkX/aklttvzv2J+/GGrruN2x1cBsR01KPVafVGuH10=:
  ssh_auth.present:
    - user: rkeadmin
    - enc: ssh-rsa
# ssh-key of root on other host
AAAAB3NzaC1yc2EAAAABIwAAAQEAv1DS2t+Kmh7spHYFg2t0592otcq8YUnZXb17WgkpaWU5cS/2eLZoNbImURkbqpVC54zVwT2dUauJZG/2bXQBul8p2OK0Rgo+Vhhrbmtnvs4GXMfgxRUo3b+zadbMPZzOAxrEWJj8nkg5PV5+5jdxLR6/3ykZtRXn2kvh2/TMHMRpxE7x5xKwyAvXiGMK9kN0dTNEun9KKfNycXX1ZbvfJ02WuzQPA7K3i8eUZZeHlnRXso/66RWsmEPCipNua23wPrBXocsNFx75hvxDFwwvj1rj4SwB9afzcQbvvnLwPheEt8pl30Xozl7qZSVaYllZaEUMcrdklXESKhj87fKDhw==:
  ssh_auth.present:
    - user: rkeadmin
    - enc: ssh-rsa
# ssh-key of someone else
AAAAB3NzaC1yc2EAAAABJQAAAIEA3P7KpLSXnkDfNfvmTkTIdlyPBRzwsHzAL60+Qw3L0U6VEuKFRLS7TTJE8s4XOdt1VxUmvWbBkEcJC8rG/g55leqJyuokZJkoNeRHdVDHT0430WpnmL21xkHl/6fGVxbxPWpwlp1XEWi8/sjvVvrc8LBeri44QMBfG8/3bkFx7zc=:
  ssh_auth.present:
    - user: rkeadmin
    - enc: ssh-rsa
/etc/sudoers.d/rkeadmin:
 file.managed:
   - source: salt://manager_org_1/rkeadmin/etc/sudoers.d/rkeadmin
   - user: root
   - group: root
   - mode: 0440
   - create: True