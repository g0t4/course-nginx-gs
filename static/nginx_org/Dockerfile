FROM gcc:bookworm as builder
# gcc (make) + mercurial pkg (hg clone nginx.org repo)

# TODO optimize script after find all of what is needed

RUN hg clone https://hg.nginx.org/nginx.org/ /nginx.org
RUN hg clone https://hg.nginx.org/xslscript /xslscript
WORKDIR /nginx.org

RUN apt update
RUN apt install -y xsltproc libxml2-utils
# make images:
RUN apt install -y netpbm

# deps for xslscript.pl (see repo above)
RUN cpan Parse::RecDescent
# add xslscript.pl to PATH
ENV PATH="/xslscript:${PATH}"

RUN make
# RUN images? (TBD if needed)


# second stage just for copying relevant files out of builder (nginx.org site files)
FROM scratch as exporter
COPY --from=builder /nginx.org /nginx.org
# only /nginx.org exists in this new image (stage) filesystem, so when I use local exporter it will only copy out /nginx.org
#   docker image build -o type=local,dest=./out/ .

#### OLD => hack to ensure xslt/* targets aren't rebuilt
#   timestamp on xslt/* files must be after corresponding `xsls/*` dependency
#   - hack works b/c in prelim testing, xslt/* works as is (no need to rebuild)
#       - luckily timestamps worked out in my macOS checkout to not trip on this issue else I might have given up!
#   - however, if time(xsls/*) > time(xslt/*), then make attempts to rebuild xslt/* which blows up on missing xslscript.pl
#   - todo is the build process for nginx.org documented somewhere?
#   - FYI I found `xslscript.pl` in the `hg log` output
# RUN touch xslt/*