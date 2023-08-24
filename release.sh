#!/bin/sh

if [ $# -lt 1 ]; then
    echo 'Usage: ./release.sh v1.2.3'
    exit 1
fi

VERSION=$1

echo "VERSION = $VERSION"
echo 'Update CHANGELOG.md now!!!'

# Invoking code and waiting for update
code -w CHANGELOG.md

# commit update
git add CHANGELOG.md
git commit -m 'Update CHANGELOG.md'

# add tag
git tag $VERSION

# push
git push
git push --tags

