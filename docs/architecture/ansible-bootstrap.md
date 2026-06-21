# Ansible Bootstrap

## Purpose

The Ansible bootstrap workflow prepares a Debian-based lab VM to run the DevOps Platform services.

The goal is to reduce manual server configuration and move the environment setup into code. This makes the lab easier to rebuild, review, and extend.

## Current Scope

The bootstrap playbook currently handles three main areas:

1. Base system packages
2. Docker installation and service configuration
3. Docker Compose stack deployment

The main playbook is located at:

```text
infra/ansible/playbooks/bootstrap.yml
```

## Inventory

The current inventory targets the local VM:

```text
infra/ansible/inventory
```

The VM is managed locally using Ansible's local connection:

```ini
[local]
localhost ansible_connection=local
```

This means Ansible runs on the same machine that it configures.

## Roles

The bootstrap workflow is organized into Ansible roles.

### common

Location:

```text
infra/ansible/roles/common
```

Responsibilities:

* Install base operating system packages
* Provide common tools required for the lab environment

Examples of managed packages:

* curl
* git
* htop
* vim
* wget

### docker

Location:

```text
infra/ansible/roles/docker
```

Responsibilities:

* Install Docker repository dependencies
* Configure the official Docker APT repository
* Install Docker Engine packages
* Install Docker Compose plugin
* Install Docker Buildx plugin
* Ensure the Docker service is enabled and running
* Add the lab user to the `docker` group

Managed Docker packages:

```text
docker-ce
docker-ce-cli
containerd.io
docker-buildx-plugin
docker-compose-plugin
```

### compose_stacks

Location:

```text
infra/ansible/roles/compose_stacks
```

Responsibilities:

* Deploy the reverse proxy stack
* Deploy the monitoring stack

The role uses Docker Compose to start the services defined in:

```text
infra/docker/reverse-proxy/compose.yaml
infra/monitoring/compose.yaml
```

## Execution

From the project root, run:

```bash
ansible-playbook infra/ansible/playbooks/bootstrap.yml --ask-become-pass
```

The playbook requires privilege escalation because it installs packages, manages system services, writes files under `/etc`, and updates user groups.

## Validation

Before running the playbook, validate its syntax:

```bash
ansible-playbook infra/ansible/playbooks/bootstrap.yml --syntax-check
```

Validate YAML formatting:

```bash
yamllint .
```

After execution, verify Docker:

```bash
docker --version
docker compose version
docker buildx version
systemctl is-active docker
```

Verify the reverse proxy:

```bash
curl http://whoami.local
curl http://nginx.local
```

Verify Prometheus targets:

```bash
curl -s http://localhost:9090/api/v1/targets | grep -o '"job":"[^"]*"'
```

Expected Prometheus jobs include:

```text
prometheus
node-exporter
cadvisor
```

## CI Validation

The GitLab CI pipeline validates the Ansible playbook syntax automatically.

The current validation stage includes:

```text
validate_docker_compose
validate_yaml
validate_ansible
```

The pipeline checks that:

* Docker Compose files are valid
* YAML files follow linting rules
* Ansible playbooks pass syntax validation

The pipeline does not currently deploy to the VM. It only validates the repository content inside the GitLab Runner environment.

## Current Limitations

The environment is not fully reproducible yet.

Current limitations:

* The VM itself is still created manually.
* Git and Ansible may still need to be installed before cloning and running the project.
* The playbook runs locally, not from a remote control node.
* Application deployment and infrastructure provisioning are not separated yet.
* Terraform is not used yet.
* Kubernetes is not implemented yet.

## Next Improvements

Planned improvements:

* Split provisioning and deployment into separate playbooks.
* Keep `bootstrap.yml` focused on VM preparation.
* Add a separate `deploy.yml` playbook for Docker Compose stacks.
* Add documentation for disaster recovery and VM rebuild.
* Add Terraform later to provision infrastructure.
* Add Kubernetes later as a separate deployment target.

## Rebuild Goal

The long-term goal is to rebuild the lab environment from code.

Target workflow:

```text
Create a new Debian VM
Clone the repository
Run the Ansible bootstrap playbook
Deploy all lab services
Validate the environment
```

This moves the project closer to Infrastructure as Code and improves reproducibility.

