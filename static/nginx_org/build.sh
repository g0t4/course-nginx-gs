trash ./out/* # safe delete, only nested files so this doesn't mess up bind mount into compose container

docker image build --output type=local,dest=out .
