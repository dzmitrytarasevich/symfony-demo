FROM composer:2.6.5 as BUILD

RUN apk add --no-cache bash &&\
curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash &&\
apk add symfony-cli

RUN git clone https://github.com/symfony/demo.git my_project &&\
    cd my_project/ &&\
    composer install

EXPOSE 8000

WORKDIR /app
ENTRYPOINT ["symfony"]
CMD ["serve"]
