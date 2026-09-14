FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl unzip ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    -o /tmp/xray.zip && \
    unzip /tmp/xray.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/xray && \
    rm /tmp/xray.zip

COPY config.json /etc/xray/config.json

EXPOSE 10000

CMD ["/usr/local/bin/xray", "run", "-config", "/etc/xray/config.json"]
