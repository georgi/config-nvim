#!/bin/bash

IFS='
'

out=''

for line in $(aurora --json $*); do
  if [ -z "$out" ]; then
    out="$line";
  else
    out="$out,$line"
  fi
done

echo "{\"errors\":[$out]}"
