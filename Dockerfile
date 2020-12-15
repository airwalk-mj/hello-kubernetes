FROM nginx:alpine

# Pull down index.html
ADD https://markjames-demo-images.s3.eu-west-2.amazonaws.com/baseline/index.html /usr/share/nginx/html/

# Make the index.html file readable
RUN chmod +r /usr/share/nginx/html/index.html

# Forward request logs to Docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
