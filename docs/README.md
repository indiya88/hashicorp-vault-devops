# HashiCorp Vault DevOps Project

This repository contains my DevOps project for setting up **HashiCorp Vault** using Docker with persistent storage on Windows.

---

## Project Overview

HashiCorp Vault is a tool for securely accessing secrets and managing sensitive data.  
This project demonstrates how to:

- Configure Vault using a file-based backend  
- Build a custom Docker image with Vault configuration  
- Run Vault in a container with persistent storage  
- Initialize, unseal, and log into Vault  
- Enable user authentication and create users  

---

- `Dockerfile`: Builds a Vault Docker image with custom config  
- `configs/vault.hcl`: Vault configuration file  
- `docs/SETUP.md`: Step-by-step setup instructions  
- `README.md`: Project overview and info

---

## How to Use

1. Follow the detailed instructions in [`docs/SETUP.md`](docs/SETUP.md) to build and run Vault.  
2. Use Docker commands to manage the Vault container.  
3. Access Vault UI at [http://localhost:8200/ui](http://localhost:8200/ui) after starting and unsealing Vault.

---

## Prerequisites

- Docker installed on your machine  
- Vault CLI installed for command line operations (optional but recommended)  
- Basic knowledge of Docker and command line usage

---

## Important Notes

- This setup disables TLS for simplicity; **do not use this in production** without securing communication.  
- Store your unseal keys and root token securely; losing them means losing access to Vault data.  
- Use a bind mount instead of Docker volume on Windows if you encounter permission issues.

---

## Contact

For questions or improvements, feel free to open an issue or contact me.

---

*Happy Vaulting! 🔐*




