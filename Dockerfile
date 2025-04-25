FROM debian:bookworm-slim

WORKDIR /app

RUN apt-get update &&\
    apt-get install python3 python3-pip curl -y

COPY DeepSea-Dashboard /app

RUN pip install --break-system-packages -r requirements.txt

RUN python3 setup.py

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh