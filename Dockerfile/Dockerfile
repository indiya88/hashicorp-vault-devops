FROM hashicorp/vault:1.15

# Copy your Vault config file from configs/ to the container's config directory
COPY configs/vault.hcl /vault/config/vault.hcl

# Expose Vault's default port
EXPOSE 8200

# Start Vault in server mode using the config file
CMD ["server", "-config=/vault/config/vault.hcl"]
