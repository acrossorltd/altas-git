FROM arigaio/atlas:latest-alpine AS lib

FROM alpine AS builder
RUN apk --no-cache add git openssh
COPY ./entrypoint.sh /entrypoint.sh
COPY --from=lib /atlas /atlas

RUN mkdir /code
RUN mkdir ~/.ssh
WORKDIR /code
RUN touch ~/.ssh/known_hosts
RUN chmod 700 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]