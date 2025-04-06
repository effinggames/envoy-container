FROM envoyproxy/envoy-alpine:v1.17.0

# Install dependencies
RUN apk --no-cache add ca-certificates gettext

# Copy the Envoy template config and entrypoint script
COPY envoy.yaml.template /etc/envoy/envoy.yaml.template
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /docker-entrypoint.sh

EXPOSE 8080

# Use the entrypoint script
ENTRYPOINT ["/docker-entrypoint.sh"]