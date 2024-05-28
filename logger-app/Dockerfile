# syntax=docker/dockerfile:1
FROM bash
WORKDIR /app
COPY ./loggerapp.sh ./loggerapp.sh
RUN chmod 755 ./loggerapp.sh
CMD mkdir -p /tmp/alloy-logs ; touch /tmp/alloy-logs/loggerapp.log ; bash loggerapp.sh