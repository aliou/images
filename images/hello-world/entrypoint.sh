#!/bin/sh
set -e

echo "Hello, World!"
echo "Image: hello-world"
echo "Version: $(cat /version.txt 2>/dev/null || echo 'unknown')"
