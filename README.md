# About

This example is from the official [Getting Started](https://docs.docker.com/compose/gettingstarted/) page of Docker Docs.

This is a simple web application using Flask that maintains a hit counter in Redis that is being monitored by `ping.sh` script. The said script watches the HTTP code and alerts the administrator if the HTTP code is `200` or the status is `unhealthy`.

# Prerequisite

- Docker Desktop
    - Tested using Docker Desktop for macOS v3.3.3 (64133)
    - Engine version 20.10.6, build 370c289

# Starting the containers

Clone this repository

```bash
git clone https://github.com/jpdoria/flaskthisfish.git
```

Go to `flaskthisfish` directory

```bash
cd flaskthisfish
```

Open and edit the environment variables in `web.env` using your favorite editor

|Environment Variable|Value|
|-----------|-----------|
|DOMAIN|example.com|
|RECIPIENT|user@example.com|
|SMTP_PASS|password|
|SMTP_SERVER|smtp.example.com:587|
|SMTP_USER|administrator@example.com|

Start the containers

```bash
docker-compose up
```

Stop and remove the containers after testing

```bash
docker-compose down
```