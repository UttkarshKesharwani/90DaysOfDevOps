
### Task 1: Docker Images
1. Pull the `nginx`, `ubuntu`, and `alpine` images from Docker Hub

2. List all images on your machine — note the sizes
- The alpine is 10x time lesser than ubunutu image , because it has minimal linux distibution.

3. Compare `ubuntu` vs `alpine` — why is one much smaller?

- The Ubuntu image is larger because it contains a full Linux distribution with many system utilities and packages.
- The Alpine image is much smaller because it is designed to be a minimal Linux distribution, including only the essential components needed to run applications.
- Because of this minimal design, Alpine images are commonly used in Docker containers to reduce image size and improve performance.

4. Inspect an image — what information can you see?
- This command shows details such as image ID, layers, creation time, environment variables, configuration settings, architecture, and metadata.

5. Remove an image you no longer need


![1 to 4 point](image.png)

![5th point](image-1.png)



### Task 2: Image Layers
1. Run `docker image history nginx` — what do you see?
- This command shows a list of layers that make up the nginx image. It includes details like layer size, command used to create the layer, creation time, and image ID.

2. Each line is a **layer**. Note how some layers show sizes and some show 0B
- Each line in the output represents an image layer created during the image build process. Some layers show actual sizes because they add files or packages to the image. Other layers show 0B because they only contain metadata changes, such as environment variables or configuration instructions, and do not add new files.

3. Write in your notes: What are layers and why does Docker use them?
- Docker images are built using multiple layers, where each instruction in the Dockerfile creates a new layer. These layers are stacked on top of each other to form the final image. Docker uses layers to improve efficiency because layers can be cached and reused, which reduces build time, saves storage space, and makes image distribution faster.


### Task 3: Container Lifecycle
Practice the full lifecycle on one container:
1. **Create** a container (without starting it)
2. **Start** the container
3. **Pause** it and check status
4. **Unpause** it
5. **Stop** it
6. **Restart** it
7. **Kill** it
8. **Remove** it

Note -
The difference between docker stop and docker kill is mainly about how the container is terminated (gracefully vs immediately).

![task 3](image-2.png)


### Task 4: Working with Running Containers
1. Run an Nginx container in detached mode
2. View its **logs**
3. View **real-time logs** (follow mode)
4. **Exec** into the container and look around the filesystem
5. Run a single command inside the container without entering it
6. **Inspect** the container — find its IP address, port mappings, and mounts

---

Note :- docker logs -f <container_name or id>
  here -f => follow mode(means live streaming mode)

![task 4](image-3.png)
![task 4 , point 5,6](image-4.png)

"IPv6Gateway": "",
"Ports": {
  "80/tcp": [
      {
          "HostIp": "0.0.0.0",
          "HostPort": "80"
      },
      {
          "HostIp": "::",
          "HostPort": "80"
      }
  ]
},
"IPAddress": "172.17.0.2",



### Task 5: Cleanup
1. Stop all running containers in one command
- `docker stop $(docker ps -q)`

  - docker ps -q :- return all the id of the running container 

2. Remove all stopped containers in one command
- `docker container prune`

3. Remove unused images
- `docker image prune`

4. Check how much disk space Docker is using
- `docker system df`

![task 5](image-5.png)

