# docker-yanic

This is the basic building block for having a mapserver.
First integrating yanic and allowing it to runon docker-enabled hosts.

# Usage

Ensure that the multicast traffic is leaving the node through the correct 
interface. For example, if mmfd0 is to be used:
```
ip -6 r add ff05::2:1001/128 dev mmfd0 table local
```

Then run the container:

```
export CONFIGURATION="$(cat config.toml)"
docker run -it -e "CONFIGURATION" --network host yanic
```

# License

This is free software under the BSD-2 license
