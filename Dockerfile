FROM ubuntu:14.04
MAINTAINER Branden Timm <branden.timm@gmail.com>

# Update the system and install curl
RUN apt-get update && apt-get -y upgrade && apt-get -y install curl

# Download and install the ntopng apt repository deb
RUN curl -s -o /tmp/ntopng-apt.deb http://www.nmon.net/apt-stable/14.04/all/apt-ntop-stable.deb  && dpkg -i /tmp/ntopng-apt.deb && rm -f /tmp/ntopng-apt.deb

# Install ntopng
RUN apt-get update && apt-get -y install ntopng

# Expose the web interface port
EXPOSE 3000

# Always start by execing ntopng, additional arguments can be passed on the command line
ENTRYPOINT ["ntopng"]