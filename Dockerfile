FROM ubuntu:latest

WORKDIR /scripts

COPY entrypoint.sh /scripts/entrypoint.sh

ENTRYPOINT [ "/scripts/entrypoint.sh" ]