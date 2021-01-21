#!/bin/bash
set -e
set -o pipefail

CLIENT_ID=$1
rm -f ./server.key
cat > ./server.key

sfdx auth:jwt:grant --clientid "$CLIENT_ID"  --jwtkeyfile ./server.key --username ci@devhub.decsond.com -a HubOrg
sfdx force:org:create -v HubOrg -s -f ./admin/config/ci_scratch_template.json -d 1 -w 10 -a ciorg

rm -f ./server.key
