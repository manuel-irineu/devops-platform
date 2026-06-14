#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt install -y \
  git \
  vim \
  curl \
  wget \
  htop \
  tree \
  unzip \
  ca-certificates \
  gnupg \
  lsb-release

echo "Base packages installed successfully."
