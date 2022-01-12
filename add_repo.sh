#!/bin/bash
token=""
org=""
cat repos.txt | while read key value; do
  curl -H "Authorization: token $token" --data '{"name":"'"$key"'"}' https://api.github.com/orgs/$org/repos
  curl -H "Authorization: token $token" "https://api.github.com/repos/$org/$key/collaborators/$value" -X PUT -d '{"permission":"admin"}'
done
