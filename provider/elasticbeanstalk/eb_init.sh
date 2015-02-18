#!/bin/bash
set -eo pipefail

# env vars templating
ruby set_env.rb

#key
#secret
#region
#appname
#env name
#webapp or worker
#loadbalanced or single
#solution stack puma ruby v1.07 FIXME this number is updated VERY frequently!
#try to parse the number
#rdbs y,n
#instance profile new or existing
eb init <<EOF
$AM_KEY
$AM_SECRET
1
$APPNAME
${APPNAME}-env
1
70
2
n
1
EOF
