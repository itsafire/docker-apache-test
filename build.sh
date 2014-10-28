#!/bin/bash

set -e

echo "=== build itsafire/apache-test ==="
docker build -t itsafire/apache-test .
echo "=== build itsafire/apache-test succsessful ==="