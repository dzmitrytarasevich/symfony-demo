FROM composer:2.6.5 as BUILD

RUN git clone https://github.com/symfony/demo.git my_project &&\
    cd my_project/ &&\
    composer install
RUN pwd

FROM bitnami/symfony:6.3
COPY --from=BUILD /app/my_project/ /app

EXPOSE 8000

WORKDIR /app
ENTRYPOINT ["symfony"]
CMD ["serve"]
