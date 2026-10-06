#!/bin/bash
set -e

# Build arguments
ARGS="--router $ROUTER"

# Add second router if specified
if [ -n "$ROUTER_ALT" ]; then
  ARGS="$ARGS --router $ROUTER_ALT"
fi

# Execute OTP with all arguments
exec java $JAVA_OPTS -jar otp.jar --server --port 8080 --analyst --graphs graphs $ARGS "$@"
