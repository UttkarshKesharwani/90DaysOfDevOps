

# Self-Assessment Checklist

Run a container from Docker Hub — **Can do**

List, stop, remove containers and images — **Can do**

Explain image layers and caching — **can do**

Write a Dockerfile with basic instructions — **Can do**

Explain CMD vs ENTRYPOINT — **can do**

Build and tag a custom image — **Can do**

Create and use named volumes — **Can do**

Use bind mounts — **Can do**

Create custom networks and connect containers — **Can do**

Write docker-compose for multi-container apps — **Can do**

Use environment variables and `.env` files — **Can do**

Write multi-stage Dockerfile — **Can do**

Push image to Docker Hub — **Can do**

Use healthchecks and depends_on — **Can do**

---

# Quick-Fire Questions

### 1. What is the difference between an image and a container?

An **image** is basically a blueprint or template that contains the application code, runtime, libraries, and dependencies.
A **container** is a running instance of that image. You can run multiple containers from the same image.

---

### 2. What happens to data inside a container when you remove it?

If the data is stored only inside the container filesystem, it gets deleted when the container is removed.
That’s why Docker volumes or bind mounts are used when we need persistent data.

---

### 3. How do two containers on the same custom network communicate?

When containers are on the same Docker network, they can communicate using **container names as hostnames**.
For example, a backend container can connect to a database using something like `mongodb://mongo:27017`.

---

### 4. What does `docker compose down -v` do differently from `docker compose down`?

`docker compose down` stops and removes containers, networks, and default resources created by the compose file.

`docker compose down -v` does the same thing **but also removes volumes**, which means stored data will be deleted.

---

### 5. Why are multi-stage builds useful?

Multi-stage builds help reduce image size by separating build dependencies from runtime dependencies.
For example, you might compile an application in one stage and then copy only the final build artifacts into a smaller runtime image.

---

### 6. What is the difference between `COPY` and `ADD`?

`COPY` simply copies files from the host machine to the container image.

`ADD` can do additional things like extracting compressed archives and downloading files from URLs.
In most cases, `COPY` is preferred because it is simpler and more predictable.

---

### 7. What does `-p 8080:80` mean?

It maps a port from the host machine to the container.

In this example:

* **8080** → port on the host machine
* **80** → port inside the container

So when we access `localhost:8080`, the request is forwarded to port **80 inside the container**.

---

### 8. How do you check how much disk space Docker is using?

The command used is:

docker system df

It shows disk usage for images, containers, volumes, and build cache.

---

# Reflection

The last few days helped me understand how Docker actually works beyond just running containers.
Building Dockerfiles, working with volumes, and creating a multi-container setup using Docker Compose made things much clearer.

The areas I still want to revisit are:

* Docker image layers and caching
* The difference between CMD and ENTRYPOINT

I'll probably revisit these topics again while working on more projects so the concepts become second nature.



## Build Your Docker Cheat Sheet
Create `docker-cheatsheet.md` organized by category:
- **Container commands** — run, ps, stop, rm, exec, logs
- **Image commands** — build, pull, push, tag, ls, rm
- **Volume commands** — create, ls, inspect, rm
- **Network commands** — create, ls, inspect, connect
- **Compose commands** — up, down, ps, logs, build
- **Cleanup commands** — prune, system df
- **Dockerfile instructions** — FROM, RUN, COPY, WORKDIR, EXPOSE, CMD, ENTRYPOINT


# Container Commands

`docker run -it <image>`
Run a container in interactive mode (useful for testing images like ubuntu).

`docker run -d <image>`
Run container in detached mode (background).

`docker ps`
List running containers.

`docker ps -a`
List all containers including stopped ones.

`docker stop <container_id>`
Stop a running container.

`docker start <container_id>`
Start a stopped container.

`docker rm <container_id>`
Remove a container.

`docker exec -it <container_id> sh`
Access a running container.

`docker logs <container_id>`
View logs of a container.

---

# Image Commands

`docker build -t image_name .`
Build an image from a Dockerfile.

`docker images`
List all images available locally.

`docker pull <image>`
Download image from Docker Hub.

`docker push <image>`
Push image to Docker Hub.

`docker tag image:latest username/image:v1`
Tag an image before pushing.

`docker rmi <image>`
Remove an image.

---

# Volume Commands

`docker volume create myvolume`
Create a named volume.

`docker volume ls`
List all volumes.

`docker volume inspect myvolume`
View volume details.

`docker volume rm myvolume`
Remove a volume.

---

# Network Commands

`docker network create mynetwork`
Create custom network.

`docker network ls`
List networks.

`docker network inspect mynetwork`
Check network configuration.

`docker network connect mynetwork container`
Connect container to network.

---

# Docker Compose Commands

`docker compose up`
Start services defined in compose file.

`docker compose up --build`
Build images and start containers.

`docker compose down`
Stop and remove containers.


`docker compose down -v`
Stop and remove containers and also remove the volume associated with it .

`docker compose ps`
Check running services.

`docker compose logs`
View logs of services.

`docker compose build`
Build images defined in compose.

---

# Cleanup Commands

`docker system prune`
Remove unused containers, networks, and images.

`docker system prune -a`
Remove **everything unused**, including images.

`docker system df`
Check Docker disk usage.

---

# Dockerfile Instructions

`FROM`
Defines the base image.

`RUN`
Executes commands during image build.

`COPY`
Copies files from host to container.

`WORKDIR`
Sets working directory inside container.

`EXPOSE`
Documents which port the container uses.

`CMD`
Default command executed when container starts.

`ENTRYPOINT`
Main executable for the container.

---

This cheat sheet is meant to be something I can quickly glance at when working with Docker in real projects.
