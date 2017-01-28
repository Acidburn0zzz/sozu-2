#!/bin/sh
git config --global user.name "Haskell Pushbot"
git config --global user.email "haskell-pushbot@$(hostname)"
git config --global push.default simple
cp id_rsa $HOME/.ssh/id_rsa
chmod 0600 $HOME/.ssh/id_rsa
cd binaries
git init
git remote add origin git@github.com:ezyang/sozu-binaries.git
cp ../main main
git add .
git commit -m '"{"account":"ezyang", "repo":"sozu", "commit": "'$TRAVIS_COMMIT'"}"'
git push -f origin "HEAD:rev-$TRAVIS_COMMIT"
