#!/bin/bash
set -e
set -o pipefail

sfdx auth:jwt:grant --clientid 3MVG9SemV5D80oBeX0cnx.ekz5AjR9yfzePjZJlEK4nW1FfV7Z1EJm3cM_opgmAWOjXMF.jfIOuX.7KWGv6cf  --jwtkeyfile ./server.key --username dub.id-pmow@force.com -a HubOrg
sfdx force:org:create -v HubOrg -s -f ./config/ci_scratch_template.json -d 1 -w 10 -a ciorg
