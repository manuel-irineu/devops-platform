# ADR 0001: Use GitLab as the primary Git platform

## Status

Accepted

## Context

The project needs a Git platform for version control, public documentation, signed commits, and CI/CD.

GitHub was initially considered, but GitLab was selected because it provides integrated CI/CD and supports SSH keys for both authentication and commit signing.

## Decision

Use GitLab as the primary platform for the DevOps Platform repository.

## Consequences

- GitLab CI/CD will be used for automation.
- Repository documentation will be optimized for public portfolio visibility.
- GitHub-specific files will be avoided unless repository mirroring is added later.
