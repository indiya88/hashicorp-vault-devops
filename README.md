# HashiCorp Vault HA Setup on Debian with Consul Backend

This project sets up a **primary** and **secondary** Vault server in High Availability mode using **Consul** as the storage backend. Vault and Consul run inside Docker containers on a custom Docker network to enable communication.

---

## Prerequisites

- Debian server with Docker installed
- Basic Linux and Docker knowledge
- Vault Docker image (version 1.15 used here)
- Consul Docker image (version 1.15 used here)

---

# Create Docker Network

## Create a Docker bridge network so Vault and Consul containers can communicate internally:

docker network create --driver bridge nginx-network
```
```
## Start the Storage Consul Backend

docker run -d --name consul \
  --net nginx-network \
  -p 8500:8500 \
  -e CONSUL_BIND_INTERFACE=eth0 \
  consul:1.15 agent -server -bootstrap -ui -client=0.0.0.0
```
```

### You can access Consul UI at http://<YOUR_SERVER_IP>:8500

# Create a directory to store Vault configs:

mkdir -p /home/debian/vault-config
cd /home/debian/vault-config
```
```

# Create the primary Vault config file using the vault-primary.hcl 


# Create the secondary Vault config file using the vault-secondary.hcl

# Run the primary vault

docker run -d --name vault-primary \
  -p 8400:8400 -p 8401:8401 \
  -v /home/debian/vault-config/vault-primary.hcl:/vault/config/vault.hcl \
  --network nginx-network \
  --cap-add=IPC_LOCK \
  hashicorp/vault:1.15 server -config=/vault/config/vault.hcl
```
```
# Run the secondary vault

docker run -d --name vault-secondary \
  -p 8300:8300 -p 8301:8301 \
  -v /home/debian/vault-config/vault-secondary.hcl:/vault/config/vault.hcl \
  --network nginx-network \
  --cap-add=IPC_LOCK \
  hashicorp/vault:1.15 server -config=/vault/config/vault.hcl
```
```
# Initialize & Unseal Primary Vault

docker exec -it vault-primary sh

## Initialize Vault (only once):

vault operator init
```
```
# Save your unseal keys and root token carefully!

## Unseal Vault (run 3 times, each with a different unseal key):


vault operator unseal <unseal_key_1>
vault operator unseal <unseal_key_2>
vault operator unseal <unseal_key_3>
```
```
# Unseal Secondary Vault

## Enter the secondary Vault container shell:


docker exec -it vault-secondary sh
```
```
## Unseal it with the same keys used for the primary Vault:


vault operator unseal <unseal_key_1>
vault operator unseal <unseal_key_2>
vault operator unseal <unseal_key_3>
```
```
## The secondary Vault will enter standby mode.

# Access Vault Web UIs

## Primary Vault UI: http://<YOUR_SERVER_IP>:8400/ui

## Secondary Vault UI: http://<YOUR_SERVER_IP>:8300/ui

# Happy Vaulting! 
