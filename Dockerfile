FROM bitnami/git AS init
WORKDIR /app
COPY . .
RUN git submodule update --init

FROM klakegg/hugo AS builder
WORKDIR /app
COPY --from=init /app .
RUN hugo

FROM nginx
COPY --from=builder  /app/public /usr/share/nginx/html
