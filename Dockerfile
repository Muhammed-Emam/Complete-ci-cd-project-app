FROM nginx
RUN rm -rf /usr/share/nginx/html/*
COPY ./app/* /usr/share/nginx/html
