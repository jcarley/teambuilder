FROM jcarley/docker-phoenix:latest

ENV DEBIAN_FRONTEND=noninteractive

COPY ./run-server.sh run-server.sh
RUN chmod +x ./run-server.sh
CMD ["run-server.sh"]

