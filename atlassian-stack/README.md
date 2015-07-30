# Atlassian Stack Docker Images

A collection of [Docker](https://www.docker.com) images that together form an SSL-terminated
[Atlassian](https://www.atlassian.com) development stack: [JIRA](https://www.atlassian.com/software/jira),
[Bamboo](https://www.atlassian.com/software/bamboo), and [Stash](https://www.atlassian.com/software/stash).

# Features

* [NGiNX](http://nginx.org) SSL-terminated reverse proxy
* [PostgreSQL](http://www.postgresql.org) database
* [Maven](https://maven.apache.org) for use with Bamboo
* Simple SSL certificate configuration
* Hassle-free application linking between JIRA, Bamboo, and Stash

# Requirements

* Docker
* [Docker Compose](https://docs.docker.com/compose/)

# Setup

1. Edit `atlassian-stack.environment` and set:
 * `POSTGRES_USER` to the PostgreSQL database user you wish to use.
 * `POSTGRES_PASSWORD` to the password you wish to use for the PostgreSQL user.
 * `PROXY_HOST` to the hostname of your server.
2. Edit `docker-compose.yml` if necessary.  By default, the following local directories are used for data volumes and
you should change them if they do not suit your local environment:
 * `/opt/data/bamboo` for Bamboo
 * `/opt/data/certs` for SSL certificate and private key
 * `/opt/data/jira` for JIRA
 * `/opt/data/maven` for Maven settings and repository
 * `/opt/data/postgresql` for PostgreSQL
 * `/opt/data/stash` for Stash
3. Place your SSL certificate (`server.crt`) and private key (`server.key`) in `/opt/data/certs`.
4. Run `docker-compose build` to build all the necessary Docker images.  These images must be built locally and are not
available in the [Docker Hub](https://registry.hub.docker.com) due to the tight integration between them.

# Running

Run `docker-compose up -d` to launch the images and `docker-compose stop` to stop them.  The applications will be
available at the following URLs:

* Bamboo: `https://$PROXY_HOST/bamboo`
* JIRA: `https://$PROXY_HOST/jira`
* Stash: `https://$PROXY_HOST/stash`

During configuration, specify `postgresql` as the database host, `5432` as the database port, and `bamboo`, `jira`, or
`stash` as the database name depending on which application you are configuring.

Additionally, Stash will listen for Git-over-SSH via `$PROXY_HOST:7999`.
