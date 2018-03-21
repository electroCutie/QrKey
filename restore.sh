#!/bin/bash

cd `mktemp -d -p ./`
gpg --export $1 > gpg_pub.gpg

zbarimg --raw -q $2 | grep '[^\s]' | sort --numeric | sed 's/^... //' | openssl enc -d -a | paperkey -v --pubring=gpg_pub.gpg --input-type=raw | gpg --import

rm -rf `pwd`
