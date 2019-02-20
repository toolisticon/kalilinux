#! /bin/bash -eu

git checkout master && git merge develop && git push && git checkout develop
