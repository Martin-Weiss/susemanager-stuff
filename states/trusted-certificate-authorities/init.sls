/etc/pki/trust/anchors:
 file.recurse:
   - source: salt://trusted-certificate-authorities

/usr/sbin/update-ca-certificates:
 cmd.run