#!/bin/sh
set -e

# Print GRPC app URL for debugging
echo "Proxying gRPC service at: $GRPC_APP_URL"

# Replace environment variables in configuration template
envsubst < /etc/envoy/envoy.yaml.template > /etc/envoy/envoy.yaml

# Start Envoy
exec /usr/local/bin/envoy -c /etc/envoy/envoy.yaml "$@" 