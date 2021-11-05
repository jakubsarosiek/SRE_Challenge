#!/bin/bash

uuid=$(uuidgen)
git clone -b $1 $2 $uuid
git -C $uuid log --pretty=format:'{%n  "commit": "%H",%n  "author": "%aN <%aE>",%n  "date": "%ad",%n  "message": "%f"%n},' | perl -pe 'BEGIN{print "["}; END{print "]\n"}' | perl -pe 's/},]/}]/'>> $uuid.json
rm -rf $uuid