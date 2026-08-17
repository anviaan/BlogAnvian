FROM ghcr.io/gohugoio/hugo:v0.165.0 AS build

WORKDIR /src
COPY . .
RUN hugo --environment production --gc --minify

FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /src/public /usr/share/nginx/html
EXPOSE 80
