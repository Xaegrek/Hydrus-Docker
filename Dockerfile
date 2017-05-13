FROM python:2.7-alpine

WORKDIR /hydrus/

ADD repositories /etc/apk/repositories

RUN apk add --update build-base libjpeg-turbo jpeg-dev linux-headers zlib-dev libffi libffi-dev openssl-dev ffmpeg py-numpy@community \
                     py-yaml@edge py2-lz4@community py2-pillow@edge py-crypto@edge py-openssl@edge py-service_identity@edge \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && pip install beautifulsoup4 psutil Send2Trash twisted hsaudiotag PyPDF2 \
    && apk del build-base jpeg-dev linux-headers zlib-dev libffi-dev openssl-dev \
    && rm -rf ~/.cache

COPY ./bin/ /hydrus/bin/
COPY ./db/ /hydrus/db/
COPY ./help/ /hydrus/help/
COPY ./include/ /hydrus/include/
COPY ./static/ /hydrus/static/
COPY ./client.py /hydrus/client.py
COPY ./server.py /hydrus/server.py

VOLUME /hydrus/db/

EXPOSE 45870

CMD ["python2", "server.py"]
