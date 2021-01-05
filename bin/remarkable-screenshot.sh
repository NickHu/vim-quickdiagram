#!/usr/bin/env sh

# Grabs a screenshot from a reMarkable, and crops it

REMARKABLE_IP=10.11.99.1
REMARKABLE_SSH_KEY=~/.ssh/id_rsa_remarkable

# https://gist.github.com/owulveryck/4007cbf14e0028f373e4294f66c4ad07
ssh -i $REMARKABLE_SSH_KEY root@$REMARKABLE_IP sh <<'EOF'
#!/bin/sh
pid=`pidof xochitl`
addr=`dd if=/proc/$pid/mem bs=1 count=4 skip=4387048 2>/dev/null | hexdump | awk '{print $3$2}'`
skipbytes=`printf "%d" $((16#$addr))`
dd if=/proc/$pid/mem bs=1 count=2628288 skip=$skipbytes > /tmp/out.data
EOF

scp -i $REMARKABLE_SSH_KEY -q root@$REMARKABLE_IP:/tmp/out.data /dev/stdout | convert -depth 8 -size 1872x1404+0 gray:- -rotate -90 -chop 100x0 -trim "$1.png"
