# DevOps Internship Challenge

## Overview
This project was created as part of a DevOps internship assessment. The goal is to set up a web application with Docker, host the Docker image on Docker Hub, and automate its deployment using Docker Compose.

## Prerequisites
- A GitHub account (for hosting the repository).
- A Linux machine or virtual machine (e.g., Ubuntu).
- Installed tools:
  - Git
  - Docker
  - Docker Compose

## Steps Summary

### 1. Install Docker
- Write and execute a Bash script to install Docker on the Linux machine.

### 2. Clone the Repository
- Clone the `php-hello-world` repository from GitHub and navigate to the project directory.

### 3. Create a Dockerfile
- Create a `Dockerfile` to build a Docker image for the application using Nginx.
- Push the built Docker image to **Docker Hub** (use your Docker Hub repository for storage).

### 4. Create docker-compose.yml
- Use **Docker Compose** to deploy the application, making it accessible via port 8088.

### 5. Docker Hub Image Hosting
- Push the Docker image to your **Docker Hub** account.
- Document the Docker Hub image link to include in your project documentation.

### 6. Deployment and Automation
- While you are not using Jenkins, the application should be deployable using Docker Compose, allowing for easy scaling, updates, and management of the containerized application.
- Ensure the application is properly configured to run automatically when the containers are brought up using Docker Compose.

## Submission Checklist
- Bash script to install Docker.
- `Dockerfile` for the application.
- `docker-compose.yml` file for deployment.
- GitHub repository with all code and documentation.
- **Docker Hub image link** to your hosted Docker image.


## Repository
Find all files and documentation in the GitHub repository: https://github.com/rabinmaharjan07/intuji-devops-internship-challenge