#!/bin/sh

# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`

cp "$SCRIPTPATH"/id_rsa{,.pub} /tmp/
chmod 600 /tmp/id_rsa{,.pub}
ssh -i /tmp/id_rsa "$@" 
rm /tmp/id_rsa{,.pub}
