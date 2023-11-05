FROM composer:2.6.5

RUN composer create-project symfony/symfony-demo my_project
RUN git clone https://github.com/symfony/demo.git my_project
RUN cd my_project/
RUN composer install

EXPOSE 8000

WORKDIR my_project
ENTRYPOINT ["symfony"]
CMD ["serve"]
