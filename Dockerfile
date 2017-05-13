FROM blott/hydrus-base:latest

WORKDIR /hydrus/

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
