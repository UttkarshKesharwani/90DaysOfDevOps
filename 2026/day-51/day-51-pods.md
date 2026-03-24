


### Task 1: Create Your First Pod (Nginx)
Create a file called `nginx-pod.yaml`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  labels:
    app: nginx
spec:
  containers:
  - name: nginx
    image: nginx:latest
    ports:
    - containerPort: 80
```

`kubectl get pods -o wide`
- here "o" stands for the output format , "wide" gives some extra details about pods , "yaml" give the configration/manifest made by k8s to create a pod, and many more thing available . 

`kubectl logs nginx-pod` 
- The `kubectl logs nginx-pod` command is used to retrieve the logs from the containers running within the specified pod, if we have multiple contianers running on the same pod then we need to specify the container name using the flag `-c` and for all container `--all-containers=true`

`kubectl exec -it nginx-pod -- /bin/bash`
- if there are multiple container inside the pod then we need to specify using the flag `-c` followed by name-of-the-container

![task 1](./screenshots/image.png)
![task 1 continue](./screenshots/image-1.png)
![nginx-pod.yml file](./nginx-pod.yml)



### Task 2: Create a Custom Pod (BusyBox)
Write a new manifest `busybox-pod.yaml` from scratch (do not copy-paste the nginx one):

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: busybox-pod
  labels:
    app: busybox
    environment: dev
spec:
  containers:
  - name: busybox
    image: busybox:latest
    command: ["sh", "-c", "echo Hello from BusyBox && sleep 3600"]
```


![task 2](./screenshots/image-2.png)
![busybox-pod.yml file](./busybox-pod.yaml)


### Task 3: Imperative vs Declarative
You have been using the declarative approach (writing YAML, then `kubectl apply`). Kubernetes also supports imperative commands:

![task 3](./screenshots/image-3.png)


### Task 4: Validate Before Applying
![task 4](./screenshots/image-4.png)


### Task 5: Pod Labels and Filtering
Labels are how Kubernetes organizes and selects resources. You added labels in your manifests — now use them:

![task 5](./screenshots/image-5.png)


Write a manifest for a third pod with at least 3 labels (app, environment, team). Apply it and practice filtering.

![manifest file with label present in it ](./create-pod-with-labels.yml)
![task 5 continue](./screenshots/image-6.png)


### Task 6: Clean Up
Delete all the pods you created:

![task 6](./screenshots/image-7.png)


#  What happens when you delete a standalone Pod?
- When we delete the standalone pod it will not recreate automatically .