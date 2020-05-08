Requirements - 
EC2 Instance with Ubuntu OS and minimum 2 CPU is required.

Usage.
1. Login to the EC2 instance
2. Clone the git repo
3. Run the Install_Minikue.sh script
4. Check the logs Minikube_Date.logs for success
5. Check the Minikube version by 
   command - minikube version command post script success
6. Login as root user with
   command - sudo -i
7. Run the below command as root to start minikube
   command - minikube start --vm-driver=none 
