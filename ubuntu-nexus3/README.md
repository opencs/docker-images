# opencs/ubuntu-nexus3

# Description

This is an image that runs **SonarType Nexus3 OSS** on **Ubuntu 18.04** with the minimum
configuration possible.

## How to build

Open a command prompt/terminal inside this directory and run:

```
$ docker build -t opencs/ubuntu-nexus3  .
```

## How to run the image

### For testing

```
$ docker run -d -name nexus3 -p 8081:8081 -v ./nexus3:/sonatype-work opencs/ubuntu-nexus3 
```

### With persistent data

```
$ docker run -d --restart=unless-stopped -name nexus3 -p 8081:8081 -v /path/to/your/data/directory:/sonatype-work opencs/ubuntu-nexus3 
```
