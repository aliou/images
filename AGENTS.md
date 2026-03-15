# Agent Guidelines

This document provides information for AI agents working with this repository.

## Repository Structure

```
.
├── images/                    # Each image in its own directory
│   └── <image-name>/
│       ├── Dockerfile
│       ├── CHANGELOG.md       # Release notes per image
│       └── test.sh            # Test script (must be executable)
├── .github/workflows/
│   ├── release-please.yml     # Handles versioning via release-please
│   ├── build-and-push.yml     # Builds and pushes to GHCR
│   └── pr-test.yml            # Tests PRs before merge
├── .agents/skills/            # Local skills for this repository
│   └── docker-image-creator/  # Skill for creating new images
├── .release-please/             # Release-please configuration
│   ├── config.json              # Package configuration
│   └── manifest.json            # Current versions
└── README.md                  # User-facing documentation
```

## Release Process

**All releases go through release-please pull requests.** This is the only supported release method.

### How it works

1. Commits following [Conventional Commits](https://www.conventionalcommits.org/) are analyzed
2. When releasable changes accumulate, release-please creates a release PR
3. Merging the release PR:
   - Creates a Git tag (e.g., `v1.2.3`)
   - Creates a GitHub Release
   - Triggers build workflow to push Docker images

### Commit conventions

- `feat:` - New feature (bumps minor version)
- `fix:` - Bug fix (bumps patch version)
- `docs:` - Documentation changes (no release)
- `chore:` - Maintenance (no release)
- `feat!:` or `BREAKING CHANGE:` - Major version bump

### Forcing a release

To force a version bump when needed:

```bash
git commit --allow-empty -m "chore: release 1.0.0" -m "Release-As: 1.0.0"
```

### Why only release-please?

- Ensures all changes are documented in CHANGELOG.md
- Maintains consistent semantic versioning
- Prevents accidental releases
- All releases are traceable to a PR

## Adding a New Image

Use the `docker-image-creator` skill at `.agents/skills/docker-image-creator/SKILL.md`. It contains the complete scaffold instructions including Dockerfile LABEL requirements.

## Testing

Every image must have a `test.sh` script that:
- Accepts the image name/tag as first argument
- Runs tests against a running container
- Exits with code 0 on success, non-zero on failure

Example test.sh:

```bash
#!/bin/bash
set -e

IMAGE="$1"
echo "Testing $IMAGE"

OUTPUT=$(docker run --rm $IMAGE)
if [[ "$OUTPUT" == *"Hello"* ]]; then
  echo "Test passed"
  exit 0
else
  echo "Test failed"
  exit 1
fi
```

## GitHub Container Registry

- Registry: `ghcr.io`
- Images: `ghcr.io/aliou/<image-name>`
- Authentication uses `GITHUB_TOKEN` automatically in workflows
- Images are linked to this repository via OCI labels
