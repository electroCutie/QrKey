#!/bin/bash

cd `mktemp -p ./ -d`

gpg --export-secret-key $1 | paperkey --output-type=raw | openssl enc -a | nl -ba -n rz -w 3 -s' ' | split -l 4

for x in `ls`; do qrencode -c -o $x.png < $x ; done

montage *.png -adjoin -geometry '100%' xs.png

mv xs.png ../$1.png

rm -rf `pwd`
