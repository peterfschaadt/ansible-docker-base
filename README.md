Ansible Docker Base Image
=============================

Installs the latest version of [Ansible](https://github.com/ansible/ansible) in a [Docker](https://docker.com) image.

OS: Ubuntu 14.04 LTS - Trusty Tahr


Versions
--------

Ansible Stable = v1.9.6  
Ansible Dev = v2.1.0.0


Docker Hub
----------

[peterfschaadt/ansible-docker-base](https://hub.docker.com/r/peterfschaadt/ansible-docker-base)

To pull this image from the Docker Hub:  
```$ docker pull peterfschaadt/ansible-docker-base:latest```


Usage
-----

To use this as a base image, put this at the beginning of your Dockerfile:  
```FROM peterfschaadt/ansible-docker-base:latest```


Author
------

Peter Schaadt

[https://github.com/peterfschaadt](https://github.com/peterfschaadt)

[http://peterschaadt.com](http://peterschaadt.com)
