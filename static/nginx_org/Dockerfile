FROM gcc:bookworm as builder
# gcc (make) + mercurial pkg (hg clone nginx.org repo)

## install dependencies:
RUN apt update && apt install -y xsltproc libxml2-utils netpbm rsync


## xslscript.pl:
RUN hg clone https://hg.nginx.org/xslscript /xslscript
RUN cpan Parse::RecDescent
# add xslscript.pl to PATH
ENV PATH="/xslscript:${PATH}"

## clone nginx.org source:
RUN hg clone https://hg.nginx.org/nginx.org/ /nginx.org
WORKDIR /nginx.org

## build nginx.org site => /data/www/nginx.org
RUN mkdir -p /data/www/nginx.org
RUN make images all gzip copy
#   `make images` produces /books, nginx.png, favicon.ico
#   `make all` builds html (from xml)
#   `make gzip` compresses pages (i.e. 2022.html => 2022.gz)
#   `make copy` copies files to /data/www/nginx.org
#    not needed:
#       `make draft` appears to copy over to nested dir for prelim testing before `make copy` deploy
# FYI use `docker container diff` to find what was added with a given make target,
# - i.e. comment out all make invocations, start builder ./run-builder.sh, then run `make images` followed by (on host) `docker container diff nginx<TAB>` => list of modified files!


# second stage just for copying relevant files out of builder (nginx.org site files)
FROM scratch as exporter
COPY --from=builder /data/www/nginx.org /
# only /data/www/nginx.org dir exists in this new image (stage) filesystem (rooted at /), so when I use local exporter it will only copy out these files
#   docker image build --output type=local,dest=./out/ .
# FYI learn more about custom build outputs (--output/-o) =>
# - https://docs.docker.com/engine/reference/commandline/build/#custom-build-outputs
# - FYI not yet added to `docker compose build` => https://github.com/docker/compose/pull/10642




#### OLD => hack to ensure xslt/* targets aren't rebuilt
#   timestamp on xslt/* files must be after corresponding `xsls/*` dependency
#   - hack works b/c in prelim testing, xslt/* works as is (no need to rebuild)
#       - luckily timestamps worked out in my macOS checkout to not trip on this issue else I might have given up!
#   - however, if time(xsls/*) > time(xslt/*), then make attempts to rebuild xslt/* which blows up on missing xslscript.pl
#   - todo is the build process for nginx.org documented somewhere?
#   - FYI I found `xslscript.pl` in the `hg log` output
# RUN touch xslt/*
