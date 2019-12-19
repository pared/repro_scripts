#!/bin/bash

rm -rf remote_repo repo
mkdir remote_repo repo

set -e
set -x

maindir=$(pwd)

pushd remote_repo
git init -q && dvc init -q

echo data >> data
dvc add data

git add -A
git commit -am "add data"

popd

pushd repo
git init -q && dvc init -q
dvc import $maindir/remote_repo data

dvc status
