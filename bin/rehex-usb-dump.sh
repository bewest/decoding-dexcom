#!/bin/bash

infile=${1-'-'}

cat $infile | while IFS="," read dir hex ; do
  echo $dir
  echo $hex | xxd -p -r - - | xxd

done

