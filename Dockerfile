FROM alpine:latest

RUN apk add --no-cache curl unzip ca-certificates

RUN curl -L https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    -o /tmp/xray.zip \
    && unzip /tmp/xray.zip -d /usr/local/bin \
    && chmod +x /usr/local/bin/xray \
    && rm /tmp/xray.zip

COPY config.json /etc/xray/config.json

EXPOSE 10000

CMD ["xray", "run", "-config", "/etc/xray/config.json"]
