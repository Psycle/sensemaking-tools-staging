#!/bin/bash

# Sync local files ready to push to the remote repo

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

echo "Syncing files from ${ORIGINAL_DIR} to ${REMOTE_CHECKOUT}..."
rsync -av --delete --progress ${ORIGINAL_DIR}/. ./ --exclude .git --exclude .psycle --exclude node_modules --exclude .gitlab-ci.yml --exclude .prettierignore

cd ${ORIGINAL_DIR}

echo "Done."
