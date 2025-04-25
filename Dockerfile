FROM debian:bookworm-slim

WORKDIR /app

RUN apt-get update &&\
    apt-get install python3 python3-pip curl -y

COPY DeepSea-Dashboard /app

RUN pip install --break-system-packages -r requirements.txt

RUN python3 setup.py

CMD ["python3", "App.py"]