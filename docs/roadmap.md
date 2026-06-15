# DevOps Platform Roadmap

## Phase 0: Lab Foundation

Goal: prepare a clean and reproducible virtual machine for the DevOps lab.

Tasks:

- Create a Debian 13 VM using Virt-Manager
- Use QCOW2 for the VM disk
- Use ext4 inside the VM
- Configure bridged networking
- Install basic packages
- Configure Git identity
- Configure SSH authentication
- Configure SSH commit signing
- Create the GitLab repository

Expected outcome:

- A clean DevOps lab VM
- A GitLab repository with signed commits
- Initial project documentation

## Phase 1: Docker Foundation

Goal: learn Docker fundamentals using practical services.

Technologies:

- Docker
- Docker Compose
- Linux networking

Tasks:

- Install Docker
- Run basic containers
- Understand images, containers, volumes and networks
- Create the first Docker Compose stack
- Document all commands and decisions

Expected outcome:

- A working local container environment
- A documented Docker Compose example

## Phase 2: Reverse Proxy

Goal: expose services through a reverse proxy.

Technologies:

- Traefik or Nginx
- Docker networks
- Local DNS or hosts file

Tasks:

- Choose a reverse proxy
- Expose a sample application
- Configure service routing
- Document the architecture

Expected outcome:

- A reverse proxy routing traffic to internal services

## Phase 3: Observability

Goal: monitor the platform.

Technologies:

- Prometheus
- Grafana
- Node Exporter

Tasks:

- Deploy Prometheus
- Deploy Grafana
- Deploy Node Exporter
- Create dashboards
- Document metrics and alerts

Expected outcome:

- Basic monitoring for the VM and containers

## Phase 4: Centralized Logging

Goal: collect and visualize logs.

Technologies:

- Loki
- Promtail
- Grafana

Tasks:

- Deploy Loki
- Deploy Promtail
- Connect logs to Grafana
- Query application and system logs

Expected outcome:

- Centralized logs available in Grafana

## Phase 5: CI/CD

Goal: automate validation and deployment.

Technologies:

- GitLab CI/CD
- Docker images
- SSH deployment

Tasks:

- Create `.gitlab-ci.yml`
- Add linting or validation jobs
- Build Docker images
- Deploy to the lab VM automatically

Expected outcome:

- A working CI/CD pipeline in GitLab

## Phase 6: Configuration Management

Goal: provision the lab using automation.

Technologies:

- Ansible

Tasks:

- Create inventory
- Write base system playbooks
- Install Docker through Ansible
- Configure services through Ansible

Expected outcome:

- Repeatable VM provisioning

## Phase 7: Infrastructure as Code

Goal: manage virtual infrastructure as code.

Technologies:

- Terraform
- Libvirt provider
- KVM

Tasks:

- Define VM resources with Terraform
- Create reusable modules
- Document state management

Expected outcome:

- VMs managed by Terraform

## Phase 8: Kubernetes

Goal: build a local Kubernetes cluster.

Technologies:

- Kubernetes
- containerd
- kubectl
- Helm

Tasks:

- Create one control plane VM
- Create worker VMs
- Deploy workloads
- Expose services
- Add monitoring

Expected outcome:

- A functional local Kubernetes cluster

## Phase 9: GitOps

Goal: deploy applications declaratively.

Technologies:

- Argo CD
- Helm
- Kubernetes manifests

Tasks:

- Install Argo CD
- Create application manifests
- Deploy from Git
- Document GitOps workflow

Expected outcome:

- Git-driven Kubernetes deployments

## Phase 10: Basic MLOps

Goal: deploy basic machine learning and local AI tooling.

Technologies:

- Ollama
- Open WebUI
- MLflow
- Docker or Kubernetes

Tasks:

- Run local models with Ollama
- Deploy Open WebUI
- Track experiments with MLflow
- Document resource usage and limitations

Expected outcome:

- A basic local MLOps environment
