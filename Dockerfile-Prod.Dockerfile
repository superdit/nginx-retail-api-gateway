FROM nginx:1.20.1-alpine
RUN apk update
RUN apk upgrade
RUN apk add bash
RUN apk -U add vim
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.default.conf
ADD nginx.conf /etc/nginx/

# add nginx include (authentification)
# RUN mkdir /etc/nginx/include.conf.d
# ADD include.conf.d/* /etc/nginx/include.conf.d/

# ADD include.conf.d/* /etc/nginx/include.conf.d/
RUN mkdir /etc/nginx/include.conf.d
ADD include.conf.d/auth.retail.conf /etc/nginx/include.conf.d/
RUN touch /etc/nginx/include.conf.d/cors.header.conf

# add frontend
RUN mkdir /etc/nginx/frontend.conf.d
ADD frontend.conf.d/* /etc/nginx/frontend.conf.d/

# add backend
RUN mkdir /etc/nginx/backend.conf.d
ADD backend.conf.d/* /etc/nginx/backend.conf.d/

RUN mkdir /etc/nginx/html
RUN chmod 777 /etc/nginx/html
ADD index.html /etc/nginx/html
RUN chmod 755 /etc/nginx/html


# docker build command: $ docker build . -t halped-nginx-proxy
