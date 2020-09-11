
LAB 2 Google Cloud Fundamentals: Getting Started with GKE


#Task 1: Sign in to the Google Cloud Platform (GCP) Console


#Task 2: Confirm that needed APIs are enabled


#Task 3: Start a Kubernetes Engine cluster

# 3. For convenience, place the zone that Qwiklabs assigned you to into an environment variable called MY_ZONE. At the Cloud Shell prompt, type this partial command:


# followed by the zone that Qwiklabs assigned to you. Your complete command will look similar to this:

export MY_ZONE=us-central1-a

# 4. Start a Kubernetes cluster managed by Kubernetes Engine. Name the cluster webfrontend and configure it to run 2 nodes:

gcloud container clusters create webfrontend --zone $MY_ZONE --num-nodes 2


# 5. After the cluster is created, check your installed version of Kubernetes using the kubectl version command:

kubectl version


# 6. View your running nodes in the GCP Console. On the Navigation menu (Navigation menu), click Compute Engine > VM Instances.



#Task 4: Run and deploy a container
# 1.From your Cloud Shell prompt, launch a single instance of the nginx container. (Nginx is a popular web server.)


kubectl create deploy nginx --image=nginx:1.17.10


# 2.View the pod running the nginx container:

kubectl get pods

# 3. Expose the nginx container to the Internet:

kubectl expose deployment nginx --port 80 --type LoadBalancer

# 4. view new service:

kubectl get services

# 5. Open a new web browser tab and paste your clusters external IP address into the address bar. The default home page of the Nginx browser is displayed.

# 6. Scale up the number of pods running on your service:

ubectl scale deployment nginx --replicas 3

# 7. Confirm that Kubernetes has updated the number of pods:

kubectl get pods

# 8.Confirm that your external IP address has not changed:

kubectl get services

# 9. Return to the web browser tab in which you viewed your clusters external IP address. Refresh the page to confirm that the nginx web server is still responding.