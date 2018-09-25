from opencs/ubuntu-openjdk-8-headless

COPY build /app
COPY src/startup.sh /app

RUN mkdir /sonatype-work

# Create the user and group for the application
RUN groupadd nexus
RUN useradd -M --home-dir /sonatype-work -g nexus nexus

EXPOSE 8081
VOLUME /sonatype-work

ENTRYPOINT /app/startup.sh

