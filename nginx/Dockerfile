FROM nginx:1.21-alpine

ADD https://raw.githubusercontent.com/h5bp/server-configs-nginx/4.2.0/h5bp/media_types/character_encodings.conf /etc/nginx/
ADD https://raw.githubusercontent.com/h5bp/server-configs-nginx/4.2.0/h5bp/media_types/media_types.conf /etc/nginx/
ADD https://raw.githubusercontent.com/h5bp/server-configs-nginx/4.2.0/h5bp/web_performance/compression.conf /etc/nginx/
ADD https://raw.githubusercontent.com/h5bp/server-configs-nginx/4.2.0/mime.types /etc/nginx/

COPY nginx.conf /etc/nginx/nginx.conf
