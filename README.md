# NGINX with PHP-FPM on Ubuntu 22.04

[![Docker Hub](https://img.shields.io/badge/docker-hub?logo=docker&style=for-the-badge&link=https%3A%2F%2Fhub.docker.com%2Fr%2Fkorney4eg%2Fnginx-php)](https://hub.docker.com/r/korney4eg/nginx-php)
[![License MIT](https://img.shields.io/badge/license-MIT-blue.svg?&style=for-the-badge)](https://github.com/korney4eg/ubuntu-nginx-php/blob/master/LICENSE.md)

## Introduction

This is a Dockerfile to build an Ubuntu based container for [NGINX](https://www.nginx.com) and PHP-FPM. All those process are organised by [supervisord](http://supervisord.org).

Is a base image to build Wordpress on it.

## Getting Started

Build the container:

```
docker build -t korney4eg/nginx-php .
```

Run the container:

```
docker run -p 80:80 -it korney4eg/nginx-php
```

Check out [default page](http://localhost/index.php)

Default web root found at:

```
/var/www/html
```

Default logs found at:

```
/var/log
```
