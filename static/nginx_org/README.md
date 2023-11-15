## nginx_org builder

This folder is arranged to help build the nginx.org website files using a reproducible container environment.

## (optional) use precanned build

- Download precanned build of the nginx.org website files:
- https://github.com/g0t4/course-nginx-gs/releases/tag/precanned_nginx_org

## build

```bash

# build ./out/nginx.org
./build.sh

# debugging build
./run-builder.sh

# FYI the nested docker commands work on Windows too (I named the scripts .sh b/c I dev'd these on my mac)

```
