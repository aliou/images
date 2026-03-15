---
name: docker-image-creator
description: Create and scaffold new Docker images in this repository. Use when the user wants to add a new Docker image to the images/ directory, or when setting up the structure for a new image with Dockerfile, test script, and changelog.
---

# Docker Image Creator

Creates the scaffold for a new Docker image in this repository.

## Structure

Each image lives in `images/<image-name>/` with these required files:

- `Dockerfile` - The image definition with OCI labels
- `test.sh` - Executable test script that validates the image
- `CHANGELOG.md` - Release notes for the image
- `version.txt` - Current version string

## Steps to Create a New Image

1. Create directory: `images/<image-name>/`
2. Write `Dockerfile` with required OCI labels (see below)
3. Write `test.sh` that accepts image name as argument:
   - Must be executable
   - Exit 0 on success, non-zero on failure
   - Example: `docker run --rm "$1"`
4. Create `CHANGELOG.md` with initial version section
5. Create `version.txt` containing just the version (e.g., `0.0.1`)
6. Update `release-please-config.json` to add the new package entry
7. Update `.release-please-manifest.json` with initial version
8. Update `README.md` to list the new image

## OCI Labels Required

Always include these labels in every Dockerfile. These connect the image to this repository, allowing it to:
- Inherit repository access permissions
- Appear on the repository's packages page
- Be automatically linked when published via GitHub Actions

```dockerfile
LABEL org.opencontainers.image.source=https://github.com/aliou/images
LABEL org.opencontainers.image.description="Brief description"
LABEL org.opencontainers.image.licenses=MIT
```

**Note:** To connect a repository to your container image, the namespace for the repository and container image on GitHub must be the same. For example, they should be owned by the same user or organization.

## Test Script Requirements

The `test.sh` script:
- Receives the full image tag as `$1`
- Should test the actual functionality
- Must exit with code 0 on success
- Should output meaningful failure messages

## Registry Info

Images are published to `ghcr.io/aliou/<image-name>` (not `ghcr.io/aliou/images/<image-name>`).
