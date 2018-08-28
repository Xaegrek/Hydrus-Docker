FROM xaegrek/hydrus-docker:latest

WORKDIR /hydrus/

COPY ./hydrus/bin/ ./hydrus/bin/
COPY ./hydrus/db/ ./hydrus/db/
COPY ./hydrus/help/ ./hydrus/help/
COPY ./hydrus/include/ ./hydrus/include/
COPY ./hydrus/static/ ./hydrus/static/
COPY ./hydrus/client.py ./hydrus/client.py
COPY ./hydrus/server.py ./hydrus/server.py

VOLUME /hydrus/db/

EXPOSE 45870 45871 45872

ENTRYPOINT ["python"]

CMD ["./hydrus/server.py"]
