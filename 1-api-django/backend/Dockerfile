FROM python:3.8-alpine

RUN apk add --no-cache \
    postgresql-client \
    gcc \
    libc-dev \
    linux-headers \
    postgresql-dev \
    musl-dev \
    zlib \
    zlib-dev 

RUN pip3 install --upgrade pip

WORKDIR /
COPY . .

RUN pip3 install -r requirements.txt

ENTRYPOINT ["./entrypoint.sh"]