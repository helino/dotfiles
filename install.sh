#!/bin/sh

set -e

FILES=$(ls | grep -v 'README.md\|install.sh')
for FILE in $FILES; do
    ln -s $(pwd)/$FILE $HOME/.$FILE
done
