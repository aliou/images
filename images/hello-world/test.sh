#!/bin/bash
set -e

IMAGE="$1"
if [ -z "$IMAGE" ]; then
  echo "Usage: $0 <image-name>"
  exit 1
fi

echo "Testing image: $IMAGE"

# Run the container and capture output
OUTPUT=$(docker run --rm "$IMAGE")

# Check that output contains expected text
if [[ "$OUTPUT" == *"Hello, World!"* ]]; then
  echo "Test passed: Found 'Hello, World!' in output"
else
  echo "Test failed: 'Hello, World!' not found in output"
  echo "Output was: $OUTPUT"
  exit 1
fi

if [[ "$OUTPUT" == *"Image: hello-world"* ]]; then
  echo "Test passed: Found image name in output"
else
  echo "Test failed: Image name not found in output"
  exit 1
fi

echo "All tests passed!"
