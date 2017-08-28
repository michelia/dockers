

docker stop test; docker rm test; docker rmi gopython; docker build -t gopython .
docker run -d -P --name test gopython; docker port test 22

docker stop test
docker rm test
docker rmi gopython

