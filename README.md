
# Disposable Browser using Docker

The Disposable Browser project is designed to provide users with a secure and anonymous browsing experience through a containerized environment. By utilizing Docker, Ubuntu 20.04, Firefox, and the Tor network, this project allows users to surf the web without leaving traces on their host machines. It is particularly useful for individuals seeking privacy while browsing or testing web applications in an isolated setting. With a focus on security, the browser runs as a non-root user and routes all traffic through Tor, ensuring enhanced protection against tracking and data collection.

## Features

- Runs Firefox in a containerized environment.
- Routes all traffic through the Tor network for anonymity.
- Uses a non-root user to enhance security.

## Prerequisites

- Docker installed on your machine.



## Building the Docker Image

To build the Docker image, run the following command in your terminal:

```bash
  docker build -t <docker-image-name> .
```

Replace <docker-image-name> with your preferred image name.

## Running the Docker Container

To run the container with access to your display, execute:

```bash
  docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY <docker-image-name>

```
**Explanation of Arguments:**
- -v /tmp/.X11-unix:/tmp/.X11-unix: This flag mounts the X11 socket from your host machine into the container, allowing GUI applications to display their windows on your host's screen.
- -e DISPLAY=$DISPLAY: This environment variable specifies the display server to be used. It ensures that GUI applications in the container can connect to the host's X server.

## Enhanced Security with Isolated Network

For additional security, you can create a Docker network and run your container within it:

- Create an isolated network:

```bash
  docker network create --driver bridge isolated_net
```

- Run the container on the isolated network:

```bash
  docker run --network isolated_net -e DISPLAY=$DISPLAY --rm -v /tmp/.X11-unix:/tmp/.X11-unix <docker-image-name>

```

**Explanation of Arguments:**

- --network isolated_net: This flag connects the container to an isolated Docker network, providing an additional layer of security by limiting external access.

- --rm: This flag automatically removes the container when it exits, keeping your environment clean.


    
## Use Cases

- **Anonymous Browsing:** Perfect for users who require anonymity while browsing the internet, especially in sensitive or high-risk situations.
- **Testing Web Applications:** Use the disposable browser for testing web applications in a safe, isolated environment.
- **Privacy Protection:** Prevent tracking and data collection while accessing websites.


## Advantages

- **Isolation:** The containerized environment ensures that no residual data is stored on your host system.
- **Security:** By running the browser as a non-root user and using Tor, you enhance your privacy and security against potential threats.
- **Ease of Use:** Quickly spin up a disposable browser without needing complex configurations.
