FROM nginx

COPY server.crt server.key /
COPY default.conf /etc/nginx/conf.d

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]