# FourJunctions--Assignment

- [Kubernetes](#kubernetes)
- [Terraform](#terraform)

## Kubernetes
1. **Setup Master and Worker Nodes**

   First, I set up a Kubernetes cluster with a master node and worker node. I configured and make them connected.
   ```sh
   kubectl get nodes

![Setup Master and Worker Nodes](Kubernetes/Screenshot/Cluster%20setup.png)

2. **Clone GitHub Repository**
   Clone the GitHub repository containing Kubernetes YAML files (`nginx-deploy.yaml`, `nginx-svc.yaml`, `ingress.yaml`).

   ```sh
   git clone https://github.com/R-holmes10/FourJunctions-DevOps.git
   cd FourJunctions-DevOps/Kubernetes

![Cloned GitHub](Kubernetes/Screenshot/Yaml%20files%20I.png)

3. **Verify that the YAML files are present in the directory**
   ```sh
   cat nginx-deploy.yaml
   cat nginx-svc.yaml
   cat ingress.yaml
![Cat Yaml files](Kubernetes/Screenshot/Yaml%20files%20II.png)

4. **Apply Changes to YAML Files**
   Apply the Kubernetes YAML files to create Deployment, Service, and Ingress resources.
   ```sh
   kubectl apply -f nginx-deploy.yaml
   kubectl apply -f nginx-svc.yaml
   kubectl apply -f ingress.yaml

5. **Verify Resources**
   To check that the resources (Deployments, Services, Ingresses) are created successfully.
   ```sh
   kubectl get deploy -o wide
   kubectl get svc -o wide
   kubectl get ingress -o wide
   
![Cat Yaml files](Kubernetes/Screenshot/Running%20yaml%20files.png)
![Cat Yaml files2](Kubernetes/Screenshot/Created%20resources.png)

## Terraform

1. **Installation of Terraform in the Ubuntu Instance.**
   ```sh
   wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
   echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee       /etc/apt/sources.list.d/hashicorp.list
   sudo apt update && sudo apt install terraform
   terraform --version
   which terraform
![Install-Terraform](AWS/screenshot/terraform-install.png)

2. **Configure AWS CLI to inject ACCESS_KEY and SECRET_KEY.**
   ```sh
   aws configure

3. **Initialising Terraform in my working directory, and Validate the syntax and configuration of the Terraform files.** 
   ```sh
   cd FourJunctions/AWS
   ls
   terraform init
   terraform validate
![Init-Terraform](AWS/screenshot/terra-init-validate.png)

4. **Generate and review an execution plan for Terraform**
  ```sh
   terraform plan


![Plan-Terraform](AWS/screenshot/terra-plan.png)

![Plan2-Terraform](AWS/screenshot/terra-plan2.png)

5. 






   
