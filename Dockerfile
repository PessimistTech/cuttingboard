FROM klakegg/hugo as builder
WORKDIR /app
COPY . .
RUN hugo

FROM nginx
COPY --from=builder  /app/public /usr/share/nginx/html
