# GitLab CI

## Overview

This project uses GitLab CI to validate infrastructure configuration on every push.

## Current Pipeline

The current pipeline has one stage:

- `validate`

## Jobs

### validate_docker_compose

This job validates Docker Compose files using:

```bash
docker compose config
