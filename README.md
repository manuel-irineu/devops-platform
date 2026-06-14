# DevOps Platform

A hands-on homelab project designed to build a professional DevOps portfolio using open source technologies.

## Project Goal

This repository documents the incremental construction of a local DevOps platform running on a Debian-based virtual machine.

The long-term goal is to practice and document real-world DevOps workflows, including:

- Git and GitLab
- Docker
- Docker Compose
- Reverse Proxy
- CI/CD
- Observability
- Monitoring
- Centralized logging
- Kubernetes
- Terraform
- Ansible
- Automated deployment
- Basic MLOps
- Local AI models with Ollama

## Current Architecture

```text
Host Machine
└── KVM / Virt-Manager
    └── devops-lab VM
        └── devops-platform repository
```

## Repository Structure

```text
devops-platform/
├── apps/
│   └── sample-api/
├── docs/
│   ├── architecture/
│   ├── decisions/
│   └── ROADMAP.md
├── infra/
│   ├── ansible/
│   ├── docker-compose/
│   └── terraform/
├── scripts/
├── .gitignore
└── README.md
```

## Learning Approach

This project follows an incremental approach:

1. Build a small working system.
2. Document every technical decision.
3. Automate repeated tasks.
4. Add observability early.
5. Improve the platform through iterations.

## First Milestone

The first milestone is to run a basic Docker Compose stack with:

- A reverse proxy
- A sample application
- Basic documentation
- GitLab repository with signed commits
