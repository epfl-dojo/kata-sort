# BUILD DOCKER: docker build -t epfldojo/katasort .
# RUN DOCKER:   docker run --rm -it epfldojo/katasort
#
# Usage:
#       1. Generate data:
#          docker run -it --rm -v $(pwd):/work epfldojo/katasort ruby /work/generate_data.rb
#       2. Call script:
#          docker run -it --rm -v $(pwd):/work epfldojo/katasort sh /work/bench_all_sort.sh
#
#
FROM ubuntu:latest
MAINTAINER epfl-dojo <epfl-dojo@groupes.epfl.ch>
RUN apt-get update
RUN apt-get install -y ruby time sysbench
WORKDIR /work
