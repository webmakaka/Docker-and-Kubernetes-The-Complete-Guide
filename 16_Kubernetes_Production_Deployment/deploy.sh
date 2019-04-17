docker build -t marley/multi-client:latest -t marley/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t marley/multi-server:latest -t marley/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t marley/multi-worker:latest -t marley/multi-worker:$SHA -f ./worker/Dockerfile ./workers

docker push marley/multi-client:latest
docker push marley/multi-server:latest
docker push marley/multi-worker:latest

docker push marley/multi-client:$SHA
docker push marley/multi-server:$SHA
docker push marley/multi-worker:$SHA

kubect apply -f k8s
kubectl set image deployments/client-deployment client=marley/multi-client:$SHA
kubectl set image deployments/server-deployment server=marley/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=marley/multi-worker:$SHA