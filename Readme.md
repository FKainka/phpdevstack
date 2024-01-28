# Joomla Development Stack
[German Readme Version](Readme_de.md)

## Introduction

The Joomla Development Stack is a comprehensive Docker Compose environment specifically designed for Joomla website development, debugging, and testing. This environment provides a complete suite of tools and services to facilitate Joomla web development and ensure that your projects run smoothly.

### Key Features

Our Joomla Development Stack offers a variety of features, including:

- **Development Environment**: Docker Compose-based environment for Joomla web development.
- **Debugging Support**: Integrated Xdebug for easy debugging of Joomla applications.
- **Unit Testing**: Use PHPUnit to write and run unit tests.
- **Selenium Testing**: Automate browser tests for your Joomla websites using Selenium and WebDriver.
- **Mailhog Debugging**: Capture and debug outgoing emails with Mailhog.
- **phpMyAdmin**: Easy access to the database for managing database schemas and content.
- **Nginx Proxy**: Centralized environment management and easy access to services.

# Quick Start Guide

## 1. Customize the `.env` File

The `.env` file contains important configuration variables for your project. Adjust the following variables to configure your Joomla development environment:

- `PROJECT_NAME`: Specify the name of your project.
- `MYSQL_ROOT_PASSWORD`, `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_DATABASE`: Set the MySQL database access credentials.
- `MYSQL_PREFIX`: Set the prefix for the Joomla database tables.
- `JOOMLA_SECRET`: Set the Joomla secret for secure sessions.
- `MAIL_FROM`, `MAIL_FROM_NAME`: Configure email parameters for your Joomla website.

## 2. Add Your Joomla Website

Copy your existing Joomla website into the `html` directory in your project folder. Ensure that all Joomla files and folders are correctly placed in this directory.

## 3. Add a Database Dump as a ZIP File

If you have a database dump, compress it into a ZIP file, e.g., `backup.zip`. Place the ZIP file in the `/config/sql/init` directory. Docker will extract the ZIP file and use the database dump to initialize the database when starting the project.

## 4. Customize the Nginx Proxy (Optional)

If you have specific requirements for your Nginx proxy or need a particular configuration, modify the files in the `config/nginx` directory. Ensure that the Nginx proxy is configured according to your needs.

## 5. Start the Project

Run the following command in your project folder to start the development environment:

```bash
docker-compose up -d
```

This command will create and start all containers according to the configuration defined in your `docker-compose.yaml` file.

## 6. Switch to the `phpdev` Container (Optional)

After starting the project, you can switch to the `phpdev` container to begin your Joomla development work. You can open the container in various ways:

### Option 1: Switch with the Integrated Terminal

Open a terminal in Visual Studio Code and run the following command:

```bash
docker-compose exec phpdev bash
```

### Option 2: Switch via the Docker Extension

1. Click on the Docker icon in the left sidebar of VSCode.
2. Find the container named `phpdev` and click on it.
3. Click on "Attach Shell" or "Attach Visual Studio Code" to open an integrated terminal or VSCode instance inside the container.

You are now inside the `phpdev` container and can start developing your Joomla website.

---

# Additional Documentation

- [Dockerfile Development Container](doc/Readme_Dockerfile.md)
- [Nettools](doc/Readme_Nettools.md)