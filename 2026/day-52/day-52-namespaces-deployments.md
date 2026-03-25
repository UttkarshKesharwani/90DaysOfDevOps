

### Task 1: Explore Default Namespaces
Kubernetes comes with built-in namespaces. List them:

![task 1](./screenshots/image.png)


### Task 2: Create and Use Custom Namespaces
Create two namespaces — one for a development environment and one for staging:


![task 2](./screenshots/image-1.png)
![yml file for namespace](./yml%20files/namespace.yml)


### Task 3: Create Your First Deployment
A Deployment tells Kubernetes: "I want X replicas of this Pod running at all times." If a Pod crashes, the Deployment controller recreates it automatically.


**Verify:** What do the READY, UP-TO-DATE, and AVAILABLE columns mean in the deployment output?
- READY : 3/3 means (Ready Pods / Desired Pods)
- UP-TO-DATE: Pods using latest deployment spec
- AVAILABLE: Pods available to serve traffic

![task 2](./screenshots/image-2.png)
![deployment yml file](./yml%20files/nginx-deployment.yml)

### Task 4: Self-Healing — Delete a Pod and Watch It Come Back
This is the key difference between a Deployment and a standalone Pod.

![task 4](./screenshots/image-3.png)


### Task 5: Scale the Deployment
Change the number of replicas:

![task 5](./screenshots/image-4.png)


### Task 6: Rolling Update
Update the Nginx image version to trigger a rolling update:

![task 6](./screenshots/image-5.png)


### Task 7: Clean Up

already done 

