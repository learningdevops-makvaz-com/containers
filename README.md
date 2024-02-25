# NGINX with PHP-FPM on Ubuntu 22.04

[![Static Badge](https://img.shields.io/badge/docker-hub?logo=docker&link=https%3A%2F%2Fhub.docker.com%2Fr%2Fkorney4eg%2Fnginx-php)]
(https://hub.docker.com/r/korney4eg/nginx-php)
[![License MIT](https://img.shields.io/badge/license-MIT-blue.svg?&style=for-the-badge)](https://github.com/korney4eg/ubuntu-nginx-php/blob/master/LICENSE.md)

## Introduction

This is a Dockerfile to build an Ubuntu based container for NGINX and PHP-FPM. The container includes Composer and some settings optimization for Craft CMS and Craft Commerce. The default site contains [Craft Server Check](https://github.com/craftcms/server-check).

| Docker Tag | NGINX Version | PHP Version | Composer Version |
|------------|---------------|-------------|------------------|
| latest     | 1.23.2        | 8.1.13      | 2.4.4            |
| 3.0.1      | 1.23.2        | 8.1.13      | 2.4.4            |
| 3.0.0      | 1.23.1        | 8.1.11      | 2.4.2            |

#### Final Version running nginx on port 80

| Docker Tag | NGINX Version | PHP Version | Composer Version |
|------------|---------------|-------------|------------------|
| 2.0.3      | 1.23.1        | 8.1.9       | 2.4.1            |

#### Final Version with PHP 7.4

| Docker Tag | NGINX Version | PHP Version | Composer Version |
|------------|---------------|-------------|------------------|
| 1.2.11     | 1.21.6        | 7.4.29      | 2.3.5            |

#### Final Version with PHP 7.2

| Docker Tag | NGINX Version | PHP Version | Composer Version |
|------------|---------------|-------------|------------------|
| 0.6.1      | 1.19.5        | 7.2.34      | 2.0.7            |

## Getting Started

Build the container:

```
docker build -t binaryorigami/ubuntu-nginx-php .
```

Run the container:

```
docker run -p 80:8080 -it binaryorigami/ubuntu-nginx-php
```

Default web root found at:

```
/usr/share/nginx/html
```

Default logs found at:

```
/var/log
```
