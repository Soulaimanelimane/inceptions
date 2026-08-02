*This project has been created as part of the 42 curriculum by slimane.*

# Inception

## Description
This project aims to broaden our knowledge of system administration by using Docker. we will virtualize several Docker images, creating them in our new personal virtual machine.

The goal is to set up a small infrastructure composed of different services under specific rules, ensuring each service runs in a dedicated container built from Alpine or Debian (here we used debian). This project builds a complete web infrastructure with NGINX, WordPress, and MariaDB.

## Instructions
1. Ensure Docker and Docker Compose are installed on your VM.
2. Configure your domain name (`slimane.42.fr or your_login.42.fr`) to point to your local IP address in `/etc/hosts`.
3. Fill in your `.env` file in the `srcs` directory with your credentials.
4. Run the project using the Makefile at the root of the directory:
   ```bash
   make
   ```
5. To stop the project, run:
   ```bash
   make clean
   ```


# Project Description

## Docker in this project

This project uses Docker to isolate each service into its own container. Every service has its own Dockerfile and runs independently while communicating with the others through a dedicated Docker network.

The infrastructure contains:

- **NGINX** – Reverse proxy and HTTPS server.
- **WordPress** – a CMS and PHP application served through PHP-FPM.
- **MariaDB** – Database server used by WordPress.

Docker Compose is used to orchestrate the containers, create the network, mount persistent volumes, and define dependencies between the services.

### Project structure

```
.
├── Makefile
└── srcs
    ├── docker-compose.yml  
    ├── .env
    ├── requirements
       ├── mariadb
       ├── nginx
       └── wordpress
```

Each service is built from its own Dockerfile instead of using pre-built images, following the project requirements.

---

## Design choices

Some important design decisions made during the project include:

- Using **Debian** as the base image for all containers.
- Using **Docker Compose** to orchestrate the infrastructure.
- Using **named Docker volumes** to persist the WordPress files and MariaDB database.
- Creating a **custom Docker bridge network** so containers communicate through their service names.
- Configuring **NGINX with TLS** using a self-signed SSL certificate.
- Running **PHP-FPM** inside the WordPress container instead of Apache.

---

# Comparisons

## Virtual Machines vs Docker

| Virtual Machines | Docker |
|------------------|---------|
| Virtualize an entire operating system. | Virtualize applications using containers. |
| Include a full guest OS. | Share the host kernel. |
| Slower startup time. | Start almost instantly. |
| Consume more CPU, RAM, and storage. | Lightweight and resource efficient. |
| Better isolation. | Sufficient isolation for most applications. |

For this project, Docker is preferred because it is lightweight, portable, and allows multiple isolated services to run efficiently on the same host.

---

## Secrets vs Environment Variables

### Environment Variables

Environment variables are useful for application configuration such as:

- Database host
- Database name
- Domain name
- Ports

However, they are **not intended for highly sensitive information**, since they can be exposed through Docker inspection or process listings.

### Docker Secrets

Docker Secrets are designed to securely store confidential data such as:

- Database passwords
- WordPress administrator password
- API keys

Secrets are mounted as files inside the container and are not baked into the image, providing better security than plain environment variables.

---

## Docker Network vs Host Network

### Docker Bridge Network (used in this project)

- Containers communicate through service names.
- Containers are isolated from the host network.
- Only selected ports are exposed.
- More secure and easier to manage.

Example:

```
nginx --> wordpress --> mariadb
```

### Host Network

- Containers share the host's network stack.
- No network isolation.
- Slightly better performance.
- Higher security risk because services are directly exposed.

A bridge network is more appropriate for a multi-container web infrastructure like this project.

---

## Docker Volumes vs Bind Mounts

### Docker Volumes (used in this project)

Volumes are managed by Docker.

Advantages:

- Persistent data.
- Independent from the project directory.
- Better portability.
- Recommended for databases and production environments.

Used here for:

- MariaDB database
- WordPress files

### Bind Mounts

Bind mounts connect a container directory directly to a folder on the host machine.

Advantages:

- Easy to edit files from the host.
- Very convenient during development.

Disadvantages:

- Depend on the host filesystem.
- Less portable.
- Can accidentally modify or delete host files.

Volumes are preferred in this project because they provide reliable persistent storage independent of the host directory structure.




## Resources
- [Docker Documentation](https://docs.docker.com/)
- [Create Self-Signed](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04)
- [NGINX Official Documentation](https://nginx.org/en/docs/)
- [WordPress Support](https://wordpress.org/support/)
- [MariaDB Knowledge Base](https://mariadb.com/kb/en/)
- [WP-CLI Commands](https://developer.wordpress.org/cli/commands/)

**AI Usage Description**:
AI was used in this project to assist with optimizing Dockerfiles (reducing layers), validating the correctness of configuration files (like `nginx.conf`)and explain the more detailed things.
