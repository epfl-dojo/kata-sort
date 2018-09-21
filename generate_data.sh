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

# Check that arg $1 is set and is a multiple of 100
if [ $# -lt 1 ] || [ $(($1%100)) -ne 0 ]; then
  echo ""
  echo "    Usage: ./generate_data.sh number [where number is a multiple of 100]"
  ./generate_data.sh 500
else
  echo
  echo "     ... calling ./generate_data.sh $1"
  echo
  echo -e "\n# Shuffled numbers from 1 to $1"
  DATA_RANDOM=$(data_random $1)
  echo -e "data_random : ${DATA_RANDOM}\n"
  echo -e "\n# Roughly sorted numbers from 1 to $1"
  DATA_NEARLY_SORTED=$(data_nearly_sorted $1)
  echo -e "data_nearly_sorted : ${DATA_NEARLY_SORTED}\n"
  echo -e "\n# Reversed numbers from $1 to 1"
  DATA_REVERSED=$(data_reversed $1)
  echo -e "data_reversed : ${DATA_REVERSED}\n"
  echo -e "\n# $(($1/100)) times shuffled numbers from 199 to 100"
  DATA_FEW_UNIQUE=$(data_few_unique $1)
  echo -e "data_few_unique : ${DATA_FEW_UNIQUE}\n"

  echo -e "{\n  \"data_random\": ${DATA_RANDOM},\n  \"data_nearly_sorted\": ${DATA_NEARLY_SORTED},\n  \"data_reversed\": ${DATA_REVERSED},\n  \"data_few_unique\": ${DATA_FEW_UNIQUE}\n}" > generated_data.json
  echo "Saved to generated_data.json"
fi
