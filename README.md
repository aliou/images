# Docker Images

Docker images built via GitHub CI and hosted on GitHub Container Registry.

## Usage

```bash
docker pull ghcr.io/aliou/<image>:latest
```

## Images

| Image | Description |
|-------|-------------|
| [hello-world](./images/hello-world/) | Dummy hello-world image |

## Tags

- `latest` - Always points to the most recent release
- `X.Y.Z` - Semantic version tags (e.g., `1.2.3`)
- `X.Y` - Minor version (e.g., `1.2` points to latest patch)
- `X` - Major version (e.g., `1` points to latest minor)
