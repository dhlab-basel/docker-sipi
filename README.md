### SIPI Docker Image
---------------------------------------------------

Docker image to build and run the SIPI (Simple Image Presentation Interface ) Server: https://github.com/dhlab-basel/Sipi

#### Usage
---------------

To build an image and run a container:

````
$ git clone https://github.com/dhlab-basel/docker-sipi
(copy the Kakadu distribution ``v7_8-01382N.zip`` to the ``docker-sipi`` directory)
$ docker build -t dhlabbasel/sipi
$ docker run --name sipi --rm -it -p 1024:1024 dhlabbasel/sipi
````

#### Sources
----------------

See [SIPI Github Repo](https://github.com/dhlab-basel/Sipi) for SIPI's source code.
