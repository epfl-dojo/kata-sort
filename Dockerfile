# BUILD DOCKER: docker build -t epfldojo/katasort .
# RUN DOCKER:   docker run --rm -it epfldojo/katasort
# docker run -it --rm -v $(pwd):/work epfldojo/katasort sh /work/generate_data.sh
FROM alpine:3.7
MAINTAINER epfl-dojo
RUN apk add --no-cache jq coreutils
WORKDIR /work