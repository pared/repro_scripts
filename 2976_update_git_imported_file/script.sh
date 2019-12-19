#!/bin/bash

rm -rf repo remote_repo storage
mkdir repo remote_repo storage

set -e
set -x
main_dir=$(pwd)
pushd remote_repo

git init --quiet && dvc init -q
echo content >> git_file
git add git_file
git commit -am "init"

git add git_file

popd
pushd repo

git init --quiet && dvc init -q
dvc import -q $main_dir/remote_repo git_file
dvc update git_file
