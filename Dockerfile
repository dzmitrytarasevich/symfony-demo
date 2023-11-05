FROM composer:2.6.5 as BUILD

RUN git clone https://github.com/symfony/demo.git my_project &&\
    cd my_project/ &&\
    composer install


FROM bitnami/symfony:6.3
COPY --from=BUILD my_project/ .

EXPOSE 8000

WORKDIR my_project
ENTRYPOINT ["symfony"]
CMD ["serve"]
