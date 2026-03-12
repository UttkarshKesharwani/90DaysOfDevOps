

### Task 1: The Problem with Large Images
1. Write a simple Go, Java, or Node.js app (even a "Hello World" is fine)
2. Create a Dockerfile that builds and runs it in a **single stage**
3. Build the image and check its **size**

Note down the size — you'll compare it later.

- The size of the web image is 183MB

![task 1](image.png)
![task 1](./docker-compose.single.yml)
![task 1](./app/Dockerfile.single)




### Task 2: Multi-Stage Build
1. Rewrite the Dockerfile using **multi-stage build**:
   - Stage 1: Build the app (install dependencies, compile)
   - Stage 2: Copy only the built artifact into a minimal base image (`alpine`, `distroless`, or `scratch`)
2. Build the image and check its size again
3. Compare the two sizes

Write in your notes: Why is the multi-stage image so much smaller?
- Multi-stage builds reduce the final Docker image size by separating the build environment from the runtime environment.
- Benefits of Multi-Stage Builds
Smaller image size
Faster image pulls and deployments
Reduced attack surface
Improved security
Cleaner production images


![task 2](./docker-compose.mulitstage.yml)
![task 2](./app/Dockerfile.multistage)
![task 2](image-1.png)



### Task 3: Push to Docker Hub
1. Create a free account on [Docker Hub](https://hub.docker.com) (if you don't have one)
2. Log in from your terminal
3. Tag your image properly: `yourusername/image-name:tag`
4. Push it to Docker Hub
5. Pull it on a different machine (or after removing locally) to verify


![task 3](image-2.png)
![task 3 continue](image-3.png)


### Task 4: Docker Hub Repository
1. Go to Docker Hub and check your pushed image
2. Add a **description** to the repository
3. Explore the **tags** tab — understand how versioning works
4. Pull a specific tag vs `latest` — what happens?

![task 4](image-4.png)
![task 4](image-5.png)


### Task 5: Image Best Practices
Apply these to one of your images and rebuild:
1. Use a **minimal base image** (alpine vs ubuntu — compare sizes)
2. **Don't run as root** — add a non-root USER in your Dockerfile
3. Combine `RUN` commands to **reduce layers**
4. Use **specific tags** for base images (not `latest`)

Check the size before and after.

 > For this thing i use the distroless as the final build image 



