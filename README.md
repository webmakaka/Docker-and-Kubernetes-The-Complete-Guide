# [Stephen Grider] Docker and Kubernetes: The Complete Guide [2018, ENG]

**Original src**:  
https://github.com/StephenGrider/DockerCasts

<br/>

## 09 Dockerizing Multiple Services

<br/>

![Application](/img/pic-09-01.png?raw=true)

<br/>

![Application](/img/pic-09-02.png?raw=true)

<br/>

![Application](/img/pic-09-03.png?raw=true)

<br/>

![Application](/img/pic-09-04.png?raw=true)

<br/>

![Application](/img/pic-09-05.png?raw=true)

<br/>

![Application](/img/pic-09-06.png?raw=true)

<br/>

Stephen forgot to add in docker-compose.yml

<br/>

```
  worker:
    environment:
      - REDIS_HOST=redis
      - REDIS_PORT=6379
```

<br/>

    $ cd 09_Dockerizing_Multiple_Services
    $ docker-compose up --build
    $ ctrl^C
    $ docker-compose up

<br/>

![Application](/img/pic-09-07.png?raw=true)

http://localhost:8080/api/values/current

<br/>

```
$ docker-compose ps
                   Name                                  Command               State          Ports
-----------------------------------------------------------------------------------------------------------
09_dockerizing_multiple_services_api_1        npm run dev                      Up
09_dockerizing_multiple_services_client_1     npm run start                    Up
09_dockerizing_multiple_services_nginx_1      nginx -g daemon off;             Up      0.0.0.0:8080->80/tcp
09_dockerizing_multiple_services_postgres_1   docker-entrypoint.sh postgres    Up      5432/tcp
09_dockerizing_multiple_services_redis_1      docker-entrypoint.sh redis ...   Up      6379/tcp

```

<br/>

## 10 A Continuous Integration Workflow for Multiple Images

<br/>

![Application](/img/pic-10-01.png?raw=true)

Travis-ci.org --> OUR Project --> More options --> Settings --> Environment Variables

![Application](/img/pic-10-02.png?raw=true)

    DOCKER_ID marley
    DOCKER_PASSWORD mypassword

![Application](/img/pic-10-03.png?raw=true)

![Application](/img/pic-10-04.png?raw=true)

<br/>

### 11 Multi-Container Deployments to AWS

I do not want to pay money for testing AWS.

![Application](/img/pic-11-01.png?raw=true)

![Application](/img/pic-11-02.png?raw=true)

https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html

<br/>

Travis-ci.org --> OUR Project --> More options --> Settings --> Environment Variables

    AWS_ACCESS_KEY
    AWS_SECRET_KEY

<br/>

### 12 Onwards to Kubernetes

    $ minikube start

    $ cd 12_Onwards_to_Kubernetes/

    $ kubectl apply -f client-pod.yaml
    $ kubectl apply -f client-node-pod.yaml

<br/>

    $ kubectl get pods
    NAME         READY   STATUS    RESTARTS   AGE
    client-pod   1/1     Running   0          14s

<br/>

    $ kubectl get services
    NAME               TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
    client-node-port   NodePort    10.97.14.234   <none>        8080:31515/TCP   33s
    kubernetes         ClusterIP   10.96.0.1      <none>        443/TCP          32m

<br/>

    $ echo $(minikube service client-node-port --url)
    http://192.168.99.117:31515

<br/>

    $ kubectl delete -f client-pod.yaml
    $ kubectl delete -f client-node-pod.yaml

<br/>

## 13 Maintaining Sets of Containers with Deployments

    $ kubectl apply -f client-node-pod.yaml
    $ kubectl apply -f client-deployment.yaml
    $ kubectl get pods
    $ kubectl get deployments
    NAME                DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
    client-deployment   1         1         1            1           1m

    $ echo $(minikube service client-node-port --url)
    http://192.168.99.117:31515

<br/>

    $ kubectl get pods -o wide
    NAME                                 READY   STATUS    RESTARTS   AGE   IP           NODE
    client-deployment-588947887b-lkqsc   1/1     Running   0          8m    172.17.0.7   minikube

<br/>

    $ vi client-deployment.yaml

set replicas: 5

    $ kubectl apply -f client-deployment.yaml

<br/>

    $ kubectl get deployments
    NAME                READY   UP-TO-DATE   AVAILABLE   AGE
    client-deployment   5/5     5            5           16m

<br/>

set replicas back to: 1

<br/>

**Update container:**

    $ kubectl set image deployment/client-deployment client=marley/multi-client:v5

<br/>

**Reconfiguring Docker CLI**

    $ eval $(minikube docker-env)
    $ docker ps

<br/>

## 14 A Multi-Container App with Kubernetes

<br/>

![Application](/img/pic-14-01.png?raw=true)

<br/>

![Application](/img/pic-14-02.png?raw=true)

<br/>

![Application](/img/pic-14-03.png?raw=true)

<br/>

    $ cp -R 01-complex/ 03-k8s-local
    $ cd 03-k8s-local/


    $ kubectl get deployment
    $ kubectl delete deployment client-deployment
    $ kubectl get services
    $ kubectl delete service client-node-port

    $ kubectl apply -f k8s

<br/>

![Application](/img/pic-14-04.png?raw=true)

<br/>

![Application](/img/pic-14-05.png?raw=true)

<br/>

![Application](/img/pic-14-06.png?raw=true)

<br/>

![Application](/img/pic-14-07.png?raw=true)

    $ kubectl get storageclass
    $ kubectl describe storageclass

<br/>

### 22 Designating a PVC in a Pod Template

    $ kubectl apply -f k8s
    $ kubectl get pv
    $ kubectl get pvc


    $ kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf
    $ kubectl get secrets

    $ kubectl apply -f k8s
    service/client-cluster-ip-service unchanged
    deployment.apps/client-deployment unchanged
    persistentvolumeclaim/database-persistent-volume-claim unchanged
    service/postgres-cluster-ip-service unchanged
    deployment.apps/postgres-deployment configured
    service/redis-cluster-ip-service unchanged
    deployment.apps/redis-deployment unchanged
    service/server-cluster-ip-service unchanged
    deployment.apps/server-deployment configured
    deployment.apps/worker-deployment configured

<br/>

## 15 Handling Traffic with Ingress Controllers

<br/>

![Application](/img/pic-15-01.png?raw=true)

<br/>

![Application](/img/pic-15-02.png?raw=true)

<br/>

![Application](/img/pic-15-03.png?raw=true)

<br/>

![Application](/img/pic-15-04.png?raw=true)

https://github.com/kubernetes/ingress-nginx

https://kubernetes.github.io/ingress-nginx/deploy/#prerequisite-generic-deployment-command

    $ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml

https://kubernetes.github.io/ingress-nginx/deploy/#minikube

    $ minikube addons enable ingress

    $ minikube ip
    192.168.99.100

https://192.168.99.100/

<br/>

![Application](/img/pic-15-05.png?raw=true)

    $ minikube dashboard

---

**Marley**

<a href="https://jsdev.org">jsdev.org</a>
