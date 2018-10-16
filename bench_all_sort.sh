#!/bin/sh
# MACHINE="bla bla" ./bench_all_sort.sh

if [ -z "$MACHINE" ] ; then
  MACHINE="$(uname -a)"
fi

if [ ! -f bench_data.json ] ; then
  echo "[]" > bench_data.json 
fi

if [ ! -f generated_data.json ] ; then
  docker run -it --rm -v $(pwd):/work epfldojo/katasort ruby generate_data.rb
fi

docker run -it --rm -v $(pwd):/work -e MACHINE="$MACHINE"  epfldojo/katasort time ruby ./sort.rb
docker run -it --rm -v $(pwd):/work -e MACHINE="$MACHINE"  epfldojo/katasort time lua  ./sort.lua
