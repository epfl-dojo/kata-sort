#!/bin/bash

function data_random() {
  echo -e [$(seq  $1 -1 1 | shuf | sed -z 's/\n/, /g'  | sed 's/, $//')]
}
function data_nearly_sorted() {
  echo -e [$(for i in `seq 1 10 $1`; do seq $i 1 $((i+9)) | shuf;  done | sed -z 's/\n/, /g' | sed 's/, $//')]
}
function data_reversed() {
  echo -e [$(seq -s ', ' $1 -1 1)]
}
function data_few_unique() {
  echo -e [$(for i in `seq $(($1/100)) -1 1`; do seq 199 -1 100 | shuf;  done | sed -z 's/\n/, /g' | sed 's/, $//')]
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
  echo -n "\$data_random = " 
  data_random $1
  echo -e "\n# Roughly sorted numbers from 1 to $1"
  echo -n "\$data_nearly_sorted = "
  data_nearly_sorted $1
  echo -e "\n# Reversed numbers from $1 to 1"
  echo -n "\$data_reversed = "
  data_reversed $1
  echo -e "\n# $(($1/100)) times shuffled numbers from 199 to 100"
  echo -n "\$data_few_unique = "
  data_few_unique $1
fi