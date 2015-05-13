Readme
======

Deployment and configuration for mlhamel.org and it's network, it is quite simple
to use, just run the following commands:

    $ mkvirtualenv mlhamel.org
    $ pip install -r requirements.txt
    $ make server

Don't forget to install the ssl certificate on your machine:

    $ sudo mkdir /usr/local/share/ca-certificates/docker.mlhamel.org-cert
    $ sudo cp roles/docker/templates/ssl/certs/docker.mlhamel.org.crt /usr/local/share/ca-certificates/docker.mlhamel.org-cert
    $ sudo update-ca-certificates