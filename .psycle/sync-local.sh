#!/bin/bash

# Sync files which have been updated in the remote repo to local

ORIGINAL_DIR=$(pwd)
REMOTE_CHECKOUT=../sensemaking-tools
WORKING_BRANCH=site

if (! cd ${REMOTE_CHECKOUT}) then
  echo "Checkout remote repo to ${REMOTE_CHECKOUT} first"
  exit 1
fi

echo "Checking out latest '${WORKING_BRANCH}' branch from remote repo..."
cd ${REMOTE_CHECKOUT}
git checkout ${WORKING_BRANCH} && git pull

echo "Syncing files from ${REMOTE_CHECKOUT} to ${ORIGINAL_DIR}..."
cd ${ORIGINAL_DIR}
rsync -av --delete --progress ${REMOTE_CHECKOUT}/. ./ --exclude .git --exclude .psycle --exclude node_modules --exclude .gitlab-ci.yml --exclude .prettierignore

echo "Done."
