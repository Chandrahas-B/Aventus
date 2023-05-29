FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata
WORKDIR /aventus

COPY . /aventus

RUN apt update -y

RUN apt install software-properties-common -y

RUN add-apt-repository ppa:deadsnakes/ppa -y 

RUN apt install python3.9 -y

RUN apt install build-essential zlib1g-dev libncurses5-dev \
    libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev \ 
    libsqlite3-dev wget libbz2-dev -y

RUN apt install python3-pip -y

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

RUN apt install zbar-tools -y

RUN pip install -r requirements.txt

EXPOSE 3000

CMD python3 app.py
