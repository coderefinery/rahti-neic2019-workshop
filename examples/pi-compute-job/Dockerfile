FROM ubuntu:19.04

LABEL maintainer="CSC Rahti Team <rahti-team@postit.csc.fi>"

ARG Y_CRUNCHER_VERSION='v0.7.7.9501-static'
ENV Y_CRUNCHER_VERSION ${Y_CRUNCHER_VERSION}

RUN apt-get update \
  && apt-get install -y curl xz-utils \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/y-cruncher \
  && curl -SL http://www.numberworld.org/y-cruncher/y-cruncher%20${Y_CRUNCHER_VERSION}.tar.xz \
  | tar -xvJC /opt/y-cruncher \
  && mv /opt/y-cruncher/"y-cruncher ${Y_CRUNCHER_VERSION}"/* /opt/y-cruncher \
  && rmdir /opt/y-cruncher/"y-cruncher ${Y_CRUNCHER_VERSION}"

WORKDIR /opt/y-cruncher

CMD [ "/opt/y-cruncher/y-cruncher" ]
