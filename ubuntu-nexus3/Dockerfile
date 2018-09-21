from opencs/ubuntu-openjdk-8-headless

COPY build /app
COPY src/startup.sh /app

RUN mkdir /sonatype-work

EXPOSE 8081
VOLUME /sonatype-work

ENTRYPOINT /app/startup.sh

