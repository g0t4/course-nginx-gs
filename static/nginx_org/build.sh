# it's ok to remove this trash line (obviously if you don't have trash-cli installed don't use it)
trash ./out/* # safe delete, only nested files so this doesn't mess up bind mount into compose container

docker image build --output type=local,dest=out .
