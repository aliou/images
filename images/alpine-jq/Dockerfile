FROM alpine:3.21

# Connect this image to the repository
# This allows the image to inherit repository permissions and appear on the repo's packages page
LABEL org.opencontainers.image.source=https://github.com/aliou/images
LABEL org.opencontainers.image.description="Alpine-based image with jq installed"
LABEL org.opencontainers.image.licenses=MIT

RUN apk add --no-cache jq

ENTRYPOINT ["jq"]
