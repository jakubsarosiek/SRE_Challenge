FROM python:latest

LABEL maintainer="jakubsarosiek@hotmail.com <jakubsarosiek@hotmail.com>"

RUN apt-get update -y && \
    apt-get install -y uuid-runtime

COPY ./Config/requirements.txt /app/requirements.txt
COPY ./Scripts/findgitcommits_to_file.sh /app/findgitcommits_to_file.sh
COPY ./Scripts/app.py /app/app.py
COPY ./Scripts/findgitcommits.sh /app/findgitcommits.sh
COPY ./Config/favicon.ico /app/favicon.ico
COPY ./README.md /app/README.md

WORKDIR /app

RUN pip install -r requirements.txt

CMD ["python", "app.py"]