#!/bin/bash

opath="./docs/"
bpath="ArctKit"

rm -rf $opath

swift package --allow-writing-to-directory $opath \
 generate-documentation --target $bpath --disable-indexing \
  --output-path $opath \
   --transform-for-static-hosting \
    --hosting-base-path $bpath