# Nginx Reverse Proxy

## Overview

This document describes the first reverse proxy implementation of the DevOps Platform project.

The goal is to expose backend containers through a single HTTP entry point using Nginx as a reverse proxy.

## Current Architecture

```text
Client
  |
  v
whoami.local
  |
  v
Nginx Reverse Proxy
  |
  v
Whoami Container
