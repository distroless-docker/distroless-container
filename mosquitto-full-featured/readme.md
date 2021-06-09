## Distroless Eclipse Mosquitto Docker Image

This is an attempt to build a "distroless" docker image containing an up-to-date mosquitto MQTT broker in a scratch container. It is based on the Dockerfile contained within Mosquitto.

See [https://github.com/eclipse/mosquitto/tree/v2.0.10/docker/2.0]

> __Note__: This build is supposed to be a "full-featured" version that is TLS is supported. 

In order to get around some problems with ownership and since there is no shell available in the container instead of the `docker-entrypoint.sh` a small go programm is used which basically does the same thing as the shell-script mentioned above.

