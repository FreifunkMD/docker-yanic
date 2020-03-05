# docker-yanic

This is the basic building block for having a mapserver.
First integrating yanic and allowing it to runon docker-enabled hosts.

# Usage

Ensure that the multicast traffic is leaving the node through the correct 
interface. For example, if mmfd0 is to be used:
```
ip -6 r add ff05::2:1001/128 dev mmfd0 table local
```
# Build
Build The Container
```
docker image build -t yanic .
```

# Run
Then run the container:

```
docker run -d -p 8080:8080 --name=ffmd_yanic -v /etc/config.toml:/etc/yanic.conf:ro--network host yanic
```
# Compose
 :-D

# License

This is free software under the BSD-2 license
