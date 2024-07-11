FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=US/Eastern

RUN apt-get update
RUN apt-get upgrade -y

#RUN apt-get install -y wget 
RUN apt-get install  sudo -y
RUN apt-get install  curl -y
RUN apt-get install  npm -y
RUN apt-get install  jq -y
RUN apt-get install  apache2 -y
RUN apt-get install  apt-utils -y


COPY ./setup_12.x setup_12.x
RUN sudo -E bash -

COPY ./quakejs /quakejs

#RUN git clone https://github.com/nerosketch/quakejs.git

WORKDIR /quakejs
#RUN npm install
RUN ls

RUN rm /var/www/html/index.html && cp /quakejs/* /var/www/html/

WORKDIR /
ADD entrypoint.sh /entrypoint.sh

RUN chmod 777 ./entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
