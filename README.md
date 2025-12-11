
## 🚀 DevOps Challenge: Productionize an Application

This is a test of your skills in **Docker, Kubernetes (k8s), and DevOps**.

### Your Starting Point

You are given a basic application that is already working and can be started using `docker-compose`.

---

### Your Mission

Your task is to take this basic app and make it **production-ready** for deployment into a Kubernetes cluster.

### Key Requirements

* **Helm Chart:** Both parts of the application must be packaged and installable using a **Helm chart**.
* **Kubernetes Deployment:** The application must be configured to start and run successfully within the k8s cluster.
* **Network Accessibility:** The app must be accessible at the domain `https://target.example.com`.
    * **Note:** We know this domain won't actually resolve. However, your cluster configuration (e.g., an Ingress resource) must be set up correctly *as if* it would.

---

### CI/CD Pipeline Update

The repository also contains a CI/CD tool. You must **update the CI/CD pipeline** with the necessary steps to support this new deployment.

* **Goal:** The pipeline steps themselves do not need to be fully functional. The objective is to demonstrate a basic understanding of how to **structure and set up the pipeline** for this kind of deployment.



### How to make the Test


- Download ore fork this repo
- Update and make your changes
- Submit back by zipping the folder and send to contact point


### You will need 

- Docker
- Helm
- k8s cluster (minikube will work)

# Final Description

* I'm not recommending using a MySQL instance on Kubernetes engine. So the MySQL service will be served as a separate service.
* Added `pipenv` mechanism to install Python packages.

# Helm development

    helm upgrade --install devops-test ./helm -n devops-test --create-namespace \
        --set mySQLDatabase.host=my-db \
        --set mySQLDatabase.port=3306 \
        --set mySQLDatabase.user=my-user \
        --set mySQLDatabase.password=my-password \
        --set mySQLDatabase.db=targets

# Nginx ingress installation

Nginx ingress package is installed separately since it's not advisable to integrate the ingress installation with this CI/CD mechanism. With Helm values `docs/nginx-installation.yaml` file, the ingress will listen on each node's port 80/tcp and 443/tcp. And each node is exposed to the internet via a load balancer.

Load balancer type is normal http based protocol. Communication from load balancer -> nodes happens with http protocol.


## Ingress installation procedure.

    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    helm repo update

    helm install ingress-nginx ingress-nginx/ingress-nginx --version '4.14.1' \
      --namespace ingress-nginx --create-namespace \
      -f docs/nginx-installation.yaml
