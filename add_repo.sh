#!/bin/bash
token=""
cat repos.txt | while read key value; do
  curl -H "Authorization: token $token" --data '{"name":"'"$key"'"}' https://api.github.com/orgs/mohit-saxena-dev/repos
  curl -H "Authorization: token $token" "https://api.github.com/repos/mohit-saxena-dev/$key/collaborators/$value" -X PUT -d '{"permission":"admin"}'
done
