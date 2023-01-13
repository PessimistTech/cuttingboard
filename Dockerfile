FROM bitnami/git as init
WORKDIR /app
COPY . .
RUN git submodule update --init

FROM klakegg/hugo as builder
WORKDIR /app
COPY --from=init /app .
RUN hugo

FROM nginx
COPY --from=builder  /app/public /usr/share/nginx/html
