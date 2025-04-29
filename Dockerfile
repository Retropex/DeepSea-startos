FROM python:3.9.18-slim

WORKDIR /app

RUN apt-get update &&\
    apt-get install curl -y &&\
    apt-get clean

COPY DeepSea-Dashboard /app

RUN pip install --break-system-packages -r requirements.txt

RUN python setup.py

RUN python minify.py

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh

ENV FLASK_ENV=production
ENV PYTHONUNBUFFERED=1

CMD ["gunicorn", "-b", "0.0.0.0:5000", "App:app"]