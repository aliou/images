#!/bin/bash
set -e

IMAGE="$1"
if [ -z "$IMAGE" ]; then
  echo "Usage: $0 <image-name>"
  exit 1
fi

echo "Testing image: $IMAGE"

# Test that jq is installed and works
OUTPUT=$(docker run --rm "$IMAGE" --version)

# Check that output contains jq version
if [[ "$OUTPUT" == *"jq-"* ]]; then
  echo "Test passed: Found jq version in output"
else
  echo "Test failed: jq version not found in output"
  echo "Output was: $OUTPUT"
  exit 1
fi

# Test that jq can parse JSON
TEST_OUTPUT=$(echo '{"hello":"world"}' | docker run --rm -i "$IMAGE" '.hello')
if [[ "$TEST_OUTPUT" == '"world"' ]]; then
  echo "Test passed: jq can parse JSON"
else
  echo "Test failed: jq failed to parse JSON"
  echo "Output was: $TEST_OUTPUT"
  exit 1
fi

echo "All tests passed!"
