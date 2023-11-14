## Links

- Primary documentation sites:
    - [nginx.org](https://nginx.org/en/docs)
    - [nginx.com docs](https://docs.nginx.com/nginx)
- Installing NGINX
    - [nginx.org linux install guide](https://nginx.org/en/linux_packages.html)
    - [nginx.com install guides](https://docs.nginx.com/nginx/admin-guide/installing-nginx/)
        - [notably NGINX Open Source](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source)

## docker

- `docker image pull nginx`
- `docker container run --rm -i -t -p 8080:80 nginx`
    - `Ctrl+C` to kill container (after which `--rm` performs cleanup)
- `docker compose up` + `compose.yaml` => superior way to use `docker` + `nginx` b/c entire environment is defined in files!

## macOS + brew.sh

- `brew install nginx` => config paths will be brew/mac specific
- `brew services start nginx` => start+register nginx to run on login
    - `brew services stop nginx` => stop+unregister
    - `brew services restart nginx`
    - `run/kill` => don't register/unregister to run on login
