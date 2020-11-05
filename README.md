# README

`dris` (`docker-run-in-systemd`) is a tool that (tries to) simplify the management of [`systemd` services](https://www.freedesktop.org/software/systemd/man/systemd.service.html) for apps that run in [`docker containers`](https://www.docker.com/resources/what-container).

If you know how to run a container, you can use `dris run` instead of `docker run` and expect the container to run as a systemd service, which would automatically restart on-failure, and at boot time.

> **Disclaimer:** Although I'm using this to run some pet projects, this **HAS NOT** been thoroughly tested.

## Installation

```
curl -sSL https://raw.githubusercontent.com/stang/docker-run-in-systemd/main/get-dris.sh | sudo sh
```

## Usage

```
# list all DRIS services
dris ps

# docker run 'nginx' thru systemd (with autoboot)
dris run --net host -v /data/www:/usr/share/nginx/html:ro nginx:1.18

# deploy newer version of nginx
dris run --net host -v /data/www:/usr/share/nginx/html:ro nginx:latest

# stop the service (and disable autoboot)
dris stop nginx

# uninstall the service
yes | dris rm nginx
```

## Known limitations

Because we aimed for simplicity, the `service` name is infered from the `DOCKER_IMAGE`.
Therefore, calling `dris run` with the same image would override the existing config.

At the moment, you can't `dris run` the same DOCKER_IMAGE more than once on a given host.
