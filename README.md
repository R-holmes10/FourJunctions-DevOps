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
   Clone the GitHub repository containing Kubernetes YAML files (`nginx-deploy.yaml`, `nginx-service.yaml`, `ingress.yaml`).

   ```sh
   git clone https://github.com/R-holmes10/FourJunctions-DevOps.git
   cd FourJunctions-DevOps/Kubernetes

![Cloned GitHub](Kubernetes/Screenshot/Yaml%20files%20I.png)

3. **Verify that the YAML files are present in the directory**
   ```sh
   cat nginx-deploy.yaml
   cat nginx-service.yaml
   cat ingress.yaml
![Cat Yaml files](Kubernetes/Screenshot/Yaml%20files%20II.png)

4. **Apply Changes to YAML Files**
   Apply the Kubernetes YAML files to create Deployment, Service, and Ingress resources.
   ```sh
   kubectl apply -f nginx-deploy.yaml
   kubectl apply -f nginx-service.yaml
   kubectl apply -f ingress.yaml

5. **Verify Resources**
   To check that the resources (Deployments, Services, Ingresses) are created successfully.
   ```sh
   kubectl get deploy -o wide
   kubectl get svc -o wide
   kubectl get ingress -o wide
   
![Cat Yaml files](Kubernetes/Screenshot/Running%20yaml%20files.png)
![Cat Yaml files](Kubernetes/Screenshot/Created%20resources.png)











   
