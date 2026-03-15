FROM alpine:3.19

# Connect this image to the repository
# This allows the image to inherit repository permissions and appear on the repo's packages page
LABEL org.opencontainers.image.source=https://github.com/aliou/images
LABEL org.opencontainers.image.description="A dummy hello-world image for testing the release pipeline"
LABEL org.opencontainers.image.licenses=MIT

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
