#Etap 1
#obraz bazowy scratch
FROM scratch as builder
ADD alpine-minirootfs-3.19.1-aarch64.tar /

#curl install
RUN apk add --update curl && \
rm -rf /var/cache/apk/*

#node install
RUN apk add --no-cache nodejs npm

#katalog roboczy
WORKDIR /app

#kopiowanie plikow do kontenera
COPY ./index.js .
COPY ./package.json .

RUN npm install

#Etap 2
#obraz bazowy nginx
FROM nginx:alpine

#node install
RUN apk add --update nodejs

#wersja domyslna v1.0.0
ARG VERSION
ENV APP_VERSION=test.${VERSION:-v1.0.0}

#kopiowanie plikow palikacji z I etapu do kontenera
COPY --from=builder /app /app

#ustawienie portu
EXPOSE 8081

#stan zdrowia apki przez curla
HEALTHCHECK --interval=10s --timeout=1s \
    CMD curl -f http://localhost:8081/ || exit 1

#nginx & node run
CMD ["sh", "-c", "nginx & node /app/index.js"]

