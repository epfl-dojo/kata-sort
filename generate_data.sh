#!/bin/bash
function data_random() {
  echo $(seq 1 $1 | shuf | jq -s . )
}
function data_nearly_sorted() {
  echo $(for i in `seq 1 10 $1`; do seq $i 1 $((i+9)) | shuf;  done | jq -s . )
}
function data_reversed() {
  echo $(seq $1 -1 1 | jq -s . )
}
function data_few_unique() {
  echo $(for i in `seq $(($1/100)) -1 1`; do seq 199 -1 100 | shuf;  done | jq -s . )
}
function hr() {
  echo "--------------------------------------------------------------------------------"
}
function usage() {
  hr
  echo -e "\n    Usage: ./generate_data.sh number [where number is a multiple of 100]\n"
  generate 500
}
function intro() {
  hr
  echo -e "\n     ... calling ./generate_data.sh $1\n"
}
function generate() {
  intro $1
  
  echo -e " → Shuffled numbers from 1 to $1"
  DATA_RANDOM=$(data_random $1)

  echo -e " → Roughly sorted numbers from 1 to $1"
  DATA_NEARLY_SORTED=$(data_nearly_sorted $1)

  echo -e " → Reversed numbers from $1 to 1"
  DATA_REVERSED=$(data_reversed $1)

  echo -e " → $(($1/100)) times shuffled numbers from 199 to 100"
  DATA_FEW_UNIQUE=$(data_few_unique $1)

  echo -e "{\n\
  \"data_random\":\n    ${DATA_RANDOM},\n\
  \"data_nearly_sorted\":\n    ${DATA_NEARLY_SORTED},\n\
  \"data_reversed\":\n    ${DATA_REVERSED},\n\
  \"data_few_unique\":\n    ${DATA_FEW_UNIQUE}\n}"\
  > generated_data.json
  
  echo -e "\n  ⇒ Saved to generated_data.json\n"
  hr
  echo
  cat generated_data.json
}

# Quick check for jq and shuf
hash jq 2>/dev/null || { echo >&2 "    Error: → jq is required but it's not installed. Aborting."; exit 1; }
hash shuf 2>/dev/null || { echo >&2 "    Error: → shuf is required but it's not installed. Aborting."; exit 1; }

# Check that arg $1 is set and is a multiple of 100
if [ $# -lt 1 ] || [ $(($1%100)) -ne 0 ]; then
  usage
else
  generate $1
fi
