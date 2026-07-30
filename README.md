*This project has been created as part of the 42 curriculum by slimane.*

# Inception

## Description
This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

The goal is to set up a small infrastructure composed of different services under specific rules, ensuring each service runs in a dedicated container built from Alpine or Debian. This project builds a complete web infrastructure with NGINX, WordPress + php-fpm, and MariaDB.

### Design Choices
- **Operating System**: Debian Bookworm was chosen for stability and ease of package management.
- **Service Isolation**: Each service (NGINX, WordPress, MariaDB) is isolated in its own container.
- **Process Management**: Containers run their respective services in the foreground without hacky patches or infinite loops.
- **Security**: NGINX is the only entry point to the infrastructure via port 443 (HTTPS) using TLSv1.2 or TLSv1.3.

### Technical Comparisons
- **Virtual Machines vs Docker**: Virtual Machines include a full guest operating system and are heavier on resources. Docker containers share the host OS kernel and are much more lightweight, starting instantly and using a fraction of the memory and CPU.
- **Secrets vs Environment Variables**: Environment variables can sometimes be exposed in logs or process trees. Docker Secrets provide a more secure mechanism for injecting sensitive information directly into the container's memory without leaving a trace on disk or in the container's environment variables.
- **Docker Network vs Host Network**: Host networking removes network isolation between the container and the Docker host. Using a custom Docker network (bridge) ensures containers are isolated from the host and can only communicate with each other securely using internal DNS resolution.
- **Docker Volumes vs Bind Mounts**: Bind mounts rely on the host machine's directory structure and OS. Docker Volumes are completely managed by Docker, making them easier to back up, migrate, and manage safely across different environments.

## Instructions
1. Ensure Docker and Docker Compose are installed on your VM.
2. Configure your domain name (`slimane.42.fr`) to point to your local IP address in `/etc/hosts`.
3. Fill in your `.env` file in the `srcs` directory with your credentials.
4. Run the project using the Makefile at the root of the directory:
   ```bash
   make
   ```
5. To stop the project, run:
   ```bash
   make clean
   ```

## Resources
- [Docker Documentation](https://docs.docker.com/)
- [NGINX Official Documentation](https://nginx.org/en/docs/)
- [WordPress Support](https://wordpress.org/support/)
- [MariaDB Knowledge Base](https://mariadb.com/kb/en/)

**AI Usage Description**:
AI was used in this project to assist with optimizing Dockerfiles (reducing layers), validating the correctness of configuration files (like `nginx.conf` and `www.conf`), and drafting the initial documentation structure to ensure all subject requirements were fully met.
