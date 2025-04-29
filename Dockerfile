FROM python:3.9.18-slim

WORKDIR /app

RUN apt-get update &&\
    apt-get install curl gcc -y &&\
    apt-get clean

COPY DeepSea-Dashboard /app

RUN pip install --break-system-packages -r requirements.txt

RUN python setup.py

RUN python minify.py

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh