# BUILD DOCKER: docker build -t epfldojo/katasort .
# RUN DOCKER:   docker run --rm -it epfldojo/katasort
#
# Usage:
#       1. Generate data:
#          docker run -it --rm -v $(pwd):/work epfldojo/katasort sh /work/generate_data.sh
#       2. Call script:
#          docker run -it --rm -v $(pwd):/work epfldojo/katasort ruby /work/sort.rb
#
#
FROM alpine:3.7
MAINTAINER epfl-dojo <epfl-dojo@groupes.epfl.ch>
RUN apk add --no-cache jq coreutils ruby
WORKDIR /work