### SIPI Docker Image
---

Docker image to build and run the SIPI (Simple Image Presentation Interface ) Server: https://github.com/dhlab-basel/Sipi

#### Image tags
---
  - latest [Dockerfile](https://github.com/subotic/docker-sipi/tree/master/latest/Dockerfile)

#### Build SIPI Docker Image

The Sipi docker image needs to be build by hand, as it requires the Kakadu distribution. To build the image, and push
it to the docker hub, follow the following steps:

```
$ git clone https://github.com/dhlab-basel/docker-sipi
(copy the Kakadu distribution ``v7_8-01382N.zip`` to the ``docker-sipi`` directory)
$ docker build -t dhlabbasel/sipi .
(run a container with the newly build image and do some tests)
$ docker run --name sipi --rm -it --add-host=dockerhost:$(ip route | awk '/docker0/ { print $NF }') -p 1024:1024 dhlabbasel/sipi
(Ctrl-c out of terminal will stop and delete container)
$ docker push dhlabbasel/sipi  
```

Pushing the image to the docker hub requires prior authentication with ``$ docker login``. The user needs to be
registered on http://hub.docker.com. Also, the user needs to be allowed to push to the ``dblabbasel`` organisation.

#### Running SIPI
---

To use the docker image stored locally or on the docker hub repository type:

````
$ docker run --name sipi -d --add-host=dockerhost:$(ip route | awk '/docker0/ { print $NF }') -p 1024:1024 dhlabbasel/sipi
````
  
This will create and start a docker container with the ``dhlabbasel/sipi`` image in the background. The default
behaviour is to start Sipi by calling the following command:

```
$ /sipi/local/bin/sipi --add-host=dockerhost:$(ip route | awk '/docker0/ { print $NF }') -config /sipi/config/sipi.knora-test-docker-config.lua
```

To override this default behaviour, start the container by supplying another config file:

```
$ docker run --name sipi \
              -d \
             --add-host=dockerhost:$(ip route | awk '/docker0/ { print $NF }') 
              -p 1024:1024 \
               dhlabbasel/sipi \
               /sipi/local/bin/sipi -config /sipi/config/sipi.config.lua
```

You can also mount a directory (the local directory in this example), and use a config file that is outside of the
docker container:

```
$ docker run --name sipi \
              -d \
              --add-host=dockerhost:$(ip route | awk '/docker0/ { print $NF }') 
              -p 1024:1024 \
              -v $PWD:/localdir \
               dhlabbasel/sipi \
               /sipi/local/bin/sipi -config /localdir/sipi.knora-test-config.lua
```

#### Sources
---

See [SIPI Github Repo](https://github.com/dhlab-basel/Sipi) for SIPI's source code.
