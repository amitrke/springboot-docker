# springboot-docker

docker build --build-arg ENV_PROFILE=dev --build-arg SERVICE=demo --progress=plain --no-cache -t myapp .
docker run -p 8081:8081 -it myapp --name=myapp_container