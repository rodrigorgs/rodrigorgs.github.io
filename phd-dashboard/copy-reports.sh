#!/bin/bash

FOLDERS="firefox netbeansplatform versioncontrol eclipseplatform"

for x in $FOLDERS; do
  cp -v ../../../src/verification-reopening/knitr/$x/$x.html .
done
