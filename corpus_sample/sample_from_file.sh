#!/bin/bash

raw_src=$1
raw_tgt=$2
new_src=$3
new_tgt=$4

get_seeded_random()
{
  seed="$1"
  openssl enc -aes-256-ctr -pass pass:"$seed" -nosalt \    </dev/zero 2>/dev/null
}

shuf -n 1000000 --random-source=<(get_seeded_random 42) <(cat -n $raw_src) | sort -n | cut -f2- > $new_src
shuf -n 1000000 --random-source=<(get_seeded_random 42) <(cat -n $raw_tgt) | sort -n | cut -f2- > $new_tgt
