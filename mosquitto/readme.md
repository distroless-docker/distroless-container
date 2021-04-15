## Distroless Eclipse Mosquitto Docker Image

This is an attempt to build a "distroless" docker image containing an up-to-date mosquitto MQTT broker in a scratch container. It is based on the Dockerfile contained within Mosquitto.

See [https://github.com/eclipse/mosquitto/tree/v2.0.10/docker/2.0]

> __Note__: This build is configured without certain dependencies so there is no TLS or websockets and the broker is run with ` mosquitto-no-auth.conf`. You have been warned! It might be useful within isolated docker networks though. 

