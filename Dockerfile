FROM gocd/gocd-agent-debian-11:v23.4.0
LABEL MAINTAINER="Rasmus Munk <rasmus.munk@nbi.ku.dk>"

USER root

RUN apt-get update \
    && apt install -y \
    apt-transport-https \
    wget \
    python3-dev \
    make \
    && apt-get update

# Install CSharp
RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb

RUN apt-get update \
  && apt-get install -y \
  dotnet-sdk-3.1 \
  dotnet-sdk-5.0 \
  dotnet-sdk-6.0 \
  dotnet-sdk-7.0
