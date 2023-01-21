FROM debian:bullseye-slim

RUN apt-get update && apt-get install gnupg curl -y
RUN curl https://linux-clients.seafile.com/seafile.asc -o /usr/share/keyrings/seafile-keyring.asc
RUN echo deb [arch=amd64 signed-by=/usr/share/keyrings/seafile-keyring.asc] https://linux-clients.seafile.com/seafile-deb/bullseye/ stable main | tee /etc/apt/sources.list.d/seafile.list
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get update -y
RUN apt-get install -y seafile-cli procps grep nodejs unzip
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean
RUN mkdir /lumen
RUN mkdir -p /root/.npm
RUN chown -R 1000:1000 /root/.npm

WORKDIR /seafile-client

COPY start.sh /seafile-client/start.sh

COPY lumen-server/ /seafile-client/lumen-server/
COPY config.js /seafile-client/lumen-server/config.js

RUN chmod +x /seafile-client/start.sh && \
    useradd -U -d /seafile-client -s /bin/bash seafile && \
    usermod -G users seafile && \
    chown seafile:seafile -R /seafile-client && \
    su - seafile -c "seaf-cli init -d /seafile-client"

CMD ["./start.sh"]
