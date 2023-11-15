trash ./out # safe delete
+# FYI this means you have to restart docker compose up to pick up changes b/c I am nuking bind mounted dir

docker image build --output type=local,dest=out .

