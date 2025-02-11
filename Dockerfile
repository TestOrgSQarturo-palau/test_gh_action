FROM ubuntu:latest
RUN apt-get update && apt-get install -y curl

WORKDIR /scripts

COPY entrypoint.sh /scripts/entrypoint.sh
RUN chmod +x /scripts/entrypoint.sh

ENTRYPOINT [ "/scripts/entrypoint.sh" ]
