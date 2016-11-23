FROM jcarley/docker-phoenix:latest

ENV DEBIAN_FRONTEND=noninteractive

CMD ["mix phoenix.server"]

