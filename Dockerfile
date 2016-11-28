FROM jcarley/docker-phoenix:latest

ENV DEBIAN_FRONTEND=noninteractive

COPY ./run-server.sh run-server.sh
RUN chmod +x /usr/src/app/run-server.sh
CMD ["/usr/src/app/run-server.sh"]

