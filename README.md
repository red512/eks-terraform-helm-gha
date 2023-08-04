# eks-terraform-helm-gha


## Deploying the Nginx Server

To deploy the Nginx server on a Kubernetes cluster, you'll need to follow these steps:

1. Set up the infrastructure using Terraform: Navigate to the `terraform` directory and run the necessary Terraform commands to provision the required resources for the EKS cluster.

2. Build the Docker image: The Dockerfile provided in the root directory will be used to build the Nginx server's Docker image. The GitHub Actions workflow will handle this step automatically when changes are pushed to the repository.

3. Deploy the Helm chart: The Helm chart in the `helm-chart/my-nginx-image-chart` directory will be used to deploy the Nginx server on the Kubernetes cluster. The chart includes the necessary Kubernetes configurations, such as deployment, service, and ingress.

4. Access the Nginx server: After successful deployment, the Nginx server will be accessible through the defined ingress or LoadBalancer (depending on your Kubernetes setup). You can access the server using the appropriate URL or IP address.



### Terraform

The `terraform` directory contains the following Terraform files:

1. **vpc.tf**: This Terraform file defines the configuration for the AWS Virtual Private Cloud (VPC), subnets, route tables, and other related resources. The VPC is the fundamental networking component of the AWS infrastructure, and this file sets up the basic networking infrastructure.

2. **eks.tf**: The `eks.tf` file is responsible for creating and configuring the Amazon EKS cluster. EKS is a managed Kubernetes service provided by AWS. This file will define the EKS cluster, its node groups, and other relevant settings to enable the cluster's smooth operation.

3. **iam.tf**: The `iam.tf` file contains IAM (Identity and Access Management) configurations. IAM roles, policies, and permissions are defined in this file to grant necessary access to AWS resources for the EKS cluster and other components.

4. **helm-provider.tf**: Helm is a package manager for Kubernetes applications. The `helm-provider.tf` file configures the Terraform Helm provider, which enables Terraform to interact with Helm and deploy Kubernetes applications using Helm charts.

5. **helm-load-balancer-controller.tf**: This Terraform file defines the deployment of the Helm Load Balancer Controller. The controller is used to manage the Kubernetes Ingress resources and automatically provision load balancers for services running on the EKS cluster.


## GitHub Actions Workflow

This GitHub Action automates building and publishing a Docker image to Docker Hub. It runs on-demand and performs the following steps:

1. **Checkout**: Fetches the latest code from the repository.
2. **Build**: Builds the Docker image with the tag `<USERNAME>/my-nginx-image:latest`.
3. **Publish**: Logs in to Docker Hub and pushes the image.
   
Trigger the action manually from the "Actions" tab. Configuration requires a Dockerfile, Docker Hub credentials in `DOCKER_HUB_TOKEN`, and customization of the image tag.
Replace `<USERNAME>` with your Docker Hub username and customize the repository name and image as needed.

You can review the GitHub Actions workflow configuration in the `.github/workflows/publish.yaml` file.

