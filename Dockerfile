FROM openjdk:8-alpine

MAINTAINER Clairton Rodrigo Heinzen <clairton.rodrigo@gmail.com>

RUN apk add --update openssh

RUN apk add --update git

RUN apk add --update bzip2

RUN apk add --update nodejs

RUN apk add --update maven

RUN npm -g install bower

RUN npm -g install phantomjs-prebuilt

RUN npm -g install ember-cli

EXPOSE 4200 4200
EXPOSE 8080 8080
EXPOSE 9990 9990

RUN adduser -s /bin/sh -D -u 1000 dev
USER dev
WORKDIR /home/dev

CMD ["/bin/bash"]

#
# Fazer o build
# docker build -t ${PWD##*/} .
# Para rodar usando as chaves ssh e repositorio maven do host, liberando as portas, e compartilhando a atual pasta de fontes
# docker run -i -t -v $HOME/.m2:/home/dev/.m2:rw  -v $HOME/.ssh:/home/dev/.ssh:rw -v $PWD:/home/dev/${PWD##*/}:rw -w /home/dev/${PWD##*/} -p 4200:4200 -p 8080:8080 rateio
#
