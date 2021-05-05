net.ipv4.ip_forward:
  file.replace:
    - name: /etc/sysctl.conf
    - pattern: net.ipv4.ip_forward.*
    - repl: net.ipv4.ip_forward = 1

net.ipv6.conf.all.forwarding:
  file.replace:
    - name: /etc/sysctl.conf
    - pattern: net.ipv6.conf.all.forwarding.*
    - repl: net.ipv6.conf.all.forwarding = 1

net.ipv4.ip_forward_yast:
  file.replace:
    - name: /etc/sysctl.d/70-yast.conf
    - pattern: net.ipv4.ip_forward.*
    - repl: net.ipv4.ip_forward = 1
    - ignore_if_missing: true

net.ipv4.ip_forward_salt:
  sysctl.present:
    - name: net.ipv4.ip_forward
    - value: 1
    
activate-sysctl-channges:
  cmd.run:
    - onlyif: grep 0 /proc/sys/net/ipv4/conf/eth0/forwarding /proc/sys/net/ipv4/conf/lo/forwarding
    - name: sysctl --system; echo 1 > /proc/sys/net/ipv4/conf/eth0/forwarding; echo 1 > /proc/sys/net/ipv4/conf/lo/forwarding; systemctl restart network
  
