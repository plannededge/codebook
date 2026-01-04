---
document_name: "docker-cli.rule.md"
location: ".claude/rules/docker-cli.rule.md"
codebook_id: "CB-RULE-DOCKER-001"
version: "1.0.0"
date_created: "2026-01-05"
date_last_edited: "2026-01-05"
document_type: "rule"
purpose: "Rules for safe and correct usage of Docker CLI"
cli_metadata:
  command: "docker"
  documentation_url: "https://docs.docker.com/reference/cli/docker/"
  version_check: "docker --version"
  install_docs: "https://docs.docker.com/get-docker/"
category: "rules"
status: "active"
tags:
  - "rule"
  - "cli"
  - "docker"
  - "containers"
ai_parser_instructions: |
  This rule defines safe usage of Docker CLI.
  Docker operations can affect running services.
  Be careful with prune and rm operations.
---

# Docker CLI Rules

=== DOCUMENTATION ===
<!-- AI:DOCS:START -->

**Official Documentation**: https://docs.docker.com/reference/cli/docker/

| Resource | URL |
|----------|-----|
| CLI Reference | https://docs.docker.com/reference/cli/docker/ |
| Dockerfile Reference | https://docs.docker.com/reference/dockerfile/ |
| Compose Reference | https://docs.docker.com/compose/reference/ |
| Best Practices | https://docs.docker.com/develop/develop-images/dockerfile_best-practices/ |

**IMPORTANT**: Use WebFetch or WebSearch to review current documentation for:
- Multi-stage builds
- Security best practices
- Networking configurations
- Volume management

<!-- AI:DOCS:END -->

---

=== SAFETY RULES ===
<!-- AI:SAFETY:START -->

### Critical Safety Guidelines

1. **Never run untrusted images**
   - Verify image sources
   - Use official or verified images

2. **Be careful with volumes**
   - `-v /:/host` mounts entire filesystem!
   - Named volumes are safer than bind mounts

3. **Prune commands delete data**
   - `docker system prune` removes stopped containers, unused networks, dangling images
   - `docker volume prune` removes ALL unused volumes

4. **Privileged mode is dangerous**
   - `--privileged` gives container full host access
   - Avoid unless absolutely necessary

### Never Do

```bash
# NEVER run without user confirmation
docker system prune -a  # Removes ALL unused images

# NEVER mount sensitive paths
docker run -v /etc:/etc IMAGE  # Exposes host config

# NEVER use --privileged without explicit need
docker run --privileged IMAGE

# NEVER run as root in production
docker run --user root IMAGE  # Use non-root user
```

### Pre-Flight Check

Before docker commands:
```bash
# 1. Check running containers
docker ps

# 2. Check disk usage
docker system df

# 3. Verify image source
docker inspect IMAGE --format='{{.RepoDigests}}'
```

<!-- AI:SAFETY:END -->

---

=== COMMON COMMANDS ===
<!-- AI:COMMANDS:START -->

### Images

```bash
# List images
docker images

# Pull image
docker pull IMAGE:TAG

# Build image
docker build -t NAME:TAG .

# Remove image
docker rmi IMAGE

# Inspect image
docker inspect IMAGE
```

### Containers

```bash
# List running containers
docker ps

# List all containers
docker ps -a

# Run container
docker run -d --name NAME IMAGE

# Run interactive
docker run -it IMAGE /bin/sh

# Stop container
docker stop CONTAINER

# Remove container
docker rm CONTAINER

# View logs
docker logs CONTAINER

# Execute in container
docker exec -it CONTAINER /bin/sh
```

### Volumes

```bash
# List volumes
docker volume ls

# Create volume
docker volume create VOLUME_NAME

# Inspect volume
docker volume inspect VOLUME_NAME

# Remove volume
docker volume rm VOLUME_NAME
```

### Networks

```bash
# List networks
docker network ls

# Create network
docker network create NETWORK_NAME

# Connect container
docker network connect NETWORK CONTAINER
```

### Docker Compose

```bash
# Start services
docker compose up -d

# Stop services
docker compose down

# View logs
docker compose logs -f

# Rebuild and start
docker compose up -d --build
```

<!-- AI:COMMANDS:END -->

---

=== DANGEROUS OPERATIONS ===
<!-- AI:DANGEROUS:START -->

### Require User Confirmation

| Command | Risk | Before Running |
|---------|------|----------------|
| `docker system prune -a` | Removes all unused data | Confirm space needed |
| `docker volume prune` | Deletes unused volumes | Verify no data loss |
| `docker rm -f` | Force removes running container | Confirm container |
| `docker rmi -f` | Force removes images | Check dependencies |
| `docker compose down -v` | Removes volumes | Confirm data loss OK |

### Data Loss Commands

```bash
# These delete data - always confirm first!
docker system prune      # Removes unused data
docker system prune -a   # Removes ALL unused images
docker volume prune      # Removes unused volumes
docker container prune   # Removes stopped containers
docker image prune -a    # Removes unused images
```

### Force Flags

```bash
# -f/--force bypasses safety checks
docker rm -f CONTAINER   # Kills running container
docker rmi -f IMAGE      # Removes even if in use
```

Always explain what `-f` will do before using it.

<!-- AI:DANGEROUS:END -->

---

=== AUTHENTICATION ===
<!-- AI:AUTH:START -->

### Registry Authentication

```bash
# Login to Docker Hub
docker login

# Login to other registry
docker login REGISTRY_URL

# Logout
docker logout
```

### Safe Credential Handling

1. **Use credential helpers** - Not plain text
2. **Never commit credentials** - Use `.dockerignore`
3. **Build args for secrets** - Use `--secret` in BuildKit
4. **Multi-stage builds** - Don't include secrets in final image

### Never Do

```bash
# NEVER put secrets in build args
docker build --build-arg API_KEY=xxx .  # Visible in history!

# NEVER commit credentials
COPY credentials.json /app/  # BAD

# Use BuildKit secrets instead
docker build --secret id=mysecret,src=secret.txt .
```

<!-- AI:AUTH:END -->

---

=== ERROR HANDLING ===
<!-- AI:ERRORS:START -->

### Common Errors

| Error | Cause | Solution |
|-------|-------|----------|
| "no space left" | Disk full | Run `docker system prune` |
| "port already in use" | Port conflict | Use different port or stop container |
| "image not found" | Missing or typo | Check image name/tag |
| "permission denied" | Docker daemon access | Check docker group membership |
| "network not found" | Missing network | Create network first |

### Debugging

```bash
# Inspect container
docker inspect CONTAINER

# View logs
docker logs --tail 100 CONTAINER

# Check resource usage
docker stats

# System info
docker system info
```

<!-- AI:ERRORS:END -->

---

=== DOCKERFILE BEST PRACTICES ===
<!-- AI:DOCKERFILE:START -->

### Security

```dockerfile
# Use specific versions, not :latest
FROM node:20-alpine

# Don't run as root
RUN addgroup -S app && adduser -S app -G app
USER app

# Don't include secrets
# Use multi-stage builds for build dependencies
```

### Efficiency

```dockerfile
# Order by change frequency (least to most)
COPY package*.json ./
RUN npm ci
COPY . .

# Use .dockerignore
# node_modules, .git, .env, etc.
```

<!-- AI:DOCKERFILE:END -->

---

=== USED BY ===
<!-- AI:USEDBY:START -->

| Agent | Purpose |
|-------|---------|
| @agent(devops-engineer) @ref(CB-AGENT-DEVOPS-001) | Container management |
| @agent(backend-engineer) @ref(CB-AGENT-BACKEND-001) | Local development |
| @agent(frontend-engineer) @ref(CB-AGENT-FRONTEND-001) | Build processes |

<!-- AI:USEDBY:END -->

---

=== RELATED RULES ===
<!-- AI:RELATED:START -->

| Rule | Relationship |
|------|--------------|
| @rule(flyctl) | Fly.io deployments use Docker |
| @rule(gcloud-cli) | Cloud Run uses containers |
| @skill(cicd-pipeline) | CI/CD container builds |

<!-- AI:RELATED:END -->
