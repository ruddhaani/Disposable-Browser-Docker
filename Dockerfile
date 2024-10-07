# Base image from Ubuntu
FROM ubuntu:20.04

# Install necessary packages including Firefox, X11, curl, and prerequisites for Tor
RUN apt-get update && apt-get install -y \
    firefox \
    tor \
    x11-apps \
    curl \
    gnupg2 \
    procps \
    sudo \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    dbus-x11

# Add a non-root user to run the browser
RUN useradd -ms /bin/bash browser_user && \
    echo 'browser_user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to non-root user
USER browser_user

# Start Tor in the background and then start Firefox
CMD tor & firefox --display=$DISPLAY --proxy-server="socks5://localhost:9050"

