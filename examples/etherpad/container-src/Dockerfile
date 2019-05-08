FROM centos/nodejs-8-centos7

LABEL maintainer="CSC Rahti Team <rahti-team@postit.csc.fi>"

ARG VERSION=1.7.5
ENV NODE_ENV=production

RUN wget -O etherpad-lite.tar.gz \
	https://github.com/ether/etherpad-lite/archive/"${VERSION}".tar.gz && \
	mkdir etherpad-lite && \
	tar xf etherpad-lite.tar.gz \
		--directory etherpad-lite \
		--strip-components=1 && \
	rm etherpad-lite.tar.gz

WORKDIR etherpad-lite

# install node dependencies for Etherpad
RUN ["/bin/bash", "-c", "bin/installDeps.sh && npm install mongodb@2.2.33"]

RUN chmod -R 777 .

COPY entrypoint.sh entrypoint.sh
COPY settings.json ../settings.json
EXPOSE 9001
CMD ["/opt/app-root/src/etherpad-lite/entrypoint.sh"]