#!/bin/sh

# Configuration
ACCOUNT=ezyang
REPO=sozu

git config --global user.name "Pushbot"
git config --global user.email "pushbot@$(hostname)"
git config --global push.default simple
cp id_rsa $HOME/.ssh/id_rsa
chmod 0600 $HOME/.ssh/id_rsa
cd binaries
git init
git remote add origin git@github.com:ezyang/sozu-binaries.git
cp ../main main
git add .
git commit -m '{"account":"'$ACCOUNT'", "repo":"'$REPO'", "commit": "'$TRAVIS_COMMIT'", "tag":"'$TAG'"}'
git push -f origin "HEAD:$TRAVIS_COMMIT/$TAG"
