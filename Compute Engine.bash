
LAB Google Cloud Fundamentals: Getting Started with Compute Engine

#Task 1: Sign in to the Google Cloud Platform (GCP) Console and open the Google cloud shell




#Task 2: Create a virtual machine using the GCP Console

gcloud config set compute/zone us-central1-a

gcloud compute instances create "my-vm-1" \
--machine-type "n1-standard-1" \
--image-project "debian-cloud" \
--image "debian-9-stretch-v20190213" \
--subnet "default" \
--tags http \
--direction=INGRESS \
--rules=tcp:80


#Task 3: Create a virtual machine using the gcloud command line

gcloud config set compute/zone us-central1-b

gcloud compute instances create "my-vm-2" \
--machine-type "n1-standard-1" \
--image-project "debian-cloud" \
--image "debian-9-stretch-v20190213" \
--subnet "default"



#Task 4: Connect between VM instances

# Open a command prompt on the my-vm-2 instance, click SSH in its row in the VM instances list.

# Use the ping command to confirm that my-vm-2 can reach my-vm-1 over the network:

ping my-vm-1



#Press Ctrl+C to abort the ping command.

# Use the ssh command to open a command prompt on my-vm-1:

ssh my-vm-1


# If you are prompted about whether you want to continue connecting to a host with unknown authenticity, enter yes to confirm that you do
# At the command prompt on my-vm-1, install the Nginx web server:

sudo apt-get install nginx-light -y

# Use the nano text editor to add a custom message to the home page of the web server:
sudo nano /var/www/html/index.nginx-debian.html


# Use the arrow keys to move the cursor to the line just below the h1 header. Add text like this, and replace YOUR_NAME with your name:

Hi from Omotayo

# Press Ctrl+O and then press Enter to save your edited file, and then press Ctrl+X to exit the nano text editor.

# Confirm that the web server is serving your new page. At the command prompt on my-vm-1, execute this command:

curl http://localhost/

# To exit the command prompt on my-vm-1, execute this command:

exit

# To confirm that my-vm-2 can reach the web server on my-vm-1, at the command prompt on my-vm-2, execute this command:

curl http://my-vm-1/


# Copy the External IP address for my-vm-1 and paste it into the address bar of a new browser tab. You will see your web server's home page, including your custom text.




