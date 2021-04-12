## lovejs-networking

This is meant to be 3 demo projects to illustrate isomorphic (both web and local) approaches to networking in love2d. The goal is to use the same code for both, without modification.

At the top-level I have recorded all the tasks in `make` run that for help with what you can do. You will need `docker-compose` to run everything, and `love` should be in your path.

For the ws demo, you will need [love-ws](https://github.com/holywyvern/love-ws) installed to test with love, which can be a bit more involved.

## some examples

```sh
make              # list all the things you can do

make udp-local    # Start a regular UDP socket server & the local love app
make udp-web      # Build & start a full webstack for UDP demo, complete with WASM proxy

udp-local-udp-log # Run in another shell to see your current logs
```