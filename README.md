## lovejs-networking

This is meant to be 3 demo projects to illustrate isomorphic (both web and local) approaches to networking in love.

The goal is to use the same code for both, without modification.

At the top-level I have recorded all the tasks in `make` run that for help with what you can do. You will need `docker-compose` to run everything, and `love` should be in your path.

## some examples

```sh
make udp-local    # Start a regular UDP socket server & the love frontend
make udp-web      # Build & start a full webstack for UDP demo, complete with WASM proxy
```