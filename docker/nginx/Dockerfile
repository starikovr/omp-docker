FROM nginx:1.19.10

RUN apt-get update && apt-get install -y htop mc

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./conf.d/* /etc/nginx/conf.d/

RUN mkdir -p /www/vhosts/omp

RUN chown nginx:nginx /www
RUN chown nginx:nginx /www/vhosts
RUN chown nginx:nginx /www/vhosts/omp

CMD ["nginx", "-g", "daemon off;"]