FROM composer:2.6.5

RUN git clone https://github.com/symfony/demo.git my_project &&\
    cd my_project/ &&\
    ls -la . &&\
    composer install &&\
    ls -la .

EXPOSE 8000

WORKDIR my_project
ENTRYPOINT ["symfony"]
CMD ["serve"]
