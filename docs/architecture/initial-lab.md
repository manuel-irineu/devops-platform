# Initial Lab Architecture

```text
Developer Workstation
└── Debian Host
    └── KVM / Virt-Manager
        └── devops-lab VM
            ├── Git
            ├── Docker
            ├── Docker Compose
            └── DevOps Platform repository
```

## Design Notes

- The host system remains clean.
- The lab environment is isolated inside a VM.
- The VM can be snapshotted before risky changes.
- The project can later evolve into multiple VMs for Kubernetes.
