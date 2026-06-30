# VM Rebuild Workflow

## Purpose

This document describes how to rebuild the DevOps Platform lab environment from a fresh Debian VM.

The goal is to make the environment reproducible using the repository as the source of truth.

## Current Rebuild Scope

The current rebuild workflow covers:

* Base package installation
* Docker official APT repository configuration
* Docker Engine installation
* Docker Compose plugin installation
* Local hostname configuration
* Reverse proxy stack deployment
* Monitoring stack deployment

The VM itself is still created manually.

## Requirements

A fresh Debian VM should have:

* Internet access
* A user with sudo privileges
* Git installed
* Ansible installed
* SSH access to the Git repository

Minimal setup on a new VM:

```
sudo apt update
sudo apt install -y git ansible
```

## Clone the Repository

Clone the project repository from GitLab:

```
git clone git@gitlab.com:manuel_irineu/devops-platform.git
cd devops-platform
```

Or clone it from GitHub:

```
git clone git@github.com:manuel-irineu/devops-platform.git
cd devops-platform
```

## Bootstrap the VM

Run the bootstrap playbook:

```
ansible-playbook infra/ansible/playbooks/bootstrap.yml --ask-become-pass
```

The bootstrap playbook prepares the VM using these roles:

```
common
docker
local_hosts
```

### common

The `common` role installs base operating system packages used by the lab environment.

### docker

The `docker` role configures the official Docker APT repository, installs Docker Engine, installs the Docker Compose plugin, enables the Docker service, and adds the lab user to the `docker` group.

### local_hosts

The `local_hosts` role manages local hostname entries in `/etc/hosts`.

Current local hostnames:

```
whoami.local
nginx.local
```

## Deploy the Services

Run the deploy playbook:

```
ansible-playbook infra/ansible/playbooks/deploy.yml --ask-become-pass
```

The deploy playbook applies the `compose_stacks` role.

This role deploys:

* Reverse proxy stack
* Monitoring stack

The Docker Compose files are located at:

```
infra/docker/reverse-proxy/compose.yaml
infra/monitoring/compose.yaml
```

## Validate the Environment

Check running containers:

```
docker ps
```

Validate the reverse proxy:

```
curl http://whoami.local
curl http://nginx.local
```

Validate Prometheus targets:

```
curl -s http://localhost:9090/api/v1/targets | grep -o '"job":"[^"]*"'
```

Expected jobs include:

```
prometheus
node-exporter
cadvisor
```

Validate Docker:

```
docker --version
docker compose version
systemctl is-active docker
```

## Current Limitations

The rebuild workflow is not fully automated yet.

Current manual steps:

* Creating the VM
* Installing Git
* Installing Ansible
* Configuring SSH keys
* Cloning the repository

Future improvements may include:

* Using Terraform to provision infrastructure
* Using a remote Ansible control node
* Adding a deploy stage to CI/CD
* Automating initial VM preparation
* Adding backup and restore procedures for persistent data

## Target End State

The long-term target workflow is:

```
Create VM
Clone repository
Run bootstrap.yml
Run deploy.yml
Validate services
```

This moves the project closer to a reproducible Infrastructure as Code workflow.

