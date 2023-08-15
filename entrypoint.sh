#!/bin/sh
set -e
if [[ -z "${SSH_PRIVATE_KEY}" ]]; then
  echo "environment variable \"\$SSH_PRIVATE_KEY\" is unset, exit"
  exit 1
else
  echo "\"\$SSH_PRIVATE_KEY\" is found."
fi
echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa 
chmod 700 ~/.ssh/id_rsa 
ssh-keyscan github.com >> /root/.ssh/known_hosts
if [[ -z "${SSH_GIT_REPO}" ]]; then
  echo "environment variable \"\$SSH_GIT_REPO\" is unset, exit"
  exit 1
else
  echo "\"\$SSH_GIT_REPO\" is found: ${SSH_GIT_REPO}."
fi
git clone ${SSH_GIT_REPO} . 
exec "/atlas" "$@"
