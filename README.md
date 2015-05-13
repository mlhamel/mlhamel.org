Readme
======

Deployment and configuration for mlhamel.org and it's network, it is quite simple
to use, just run the following commands:

    $ mkvirtualenv mlhamel.org
    $ pip install -r requirements.txt
    $ make server

SSL
---

With StartSSL you need to combine your ssl certificate with their pem key like that:

    $ wget http://www.startssl.com/certs/sub.class1.server.ca.pem
    $ cat roles/docker/templates/ssl/certs/docker.mlhamel.org.crt sub.class1.server.ca.pem  > roles/docker/templates/ssl/certs/docker.mlhamel.org.crt