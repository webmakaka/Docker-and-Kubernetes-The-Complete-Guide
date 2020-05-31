# [Stephen Grider] Docker and Kubernetes: The Complete Guide [2018, ENG]

**Original src**:  
https://github.com/StephenGrider/DockerCasts

**[Offtopic]**:  
Deploy application from video course [Stephen Grider] Docker and Kubernetes: The Complete Guide [2018, ENG] on local kubernetes cluster  
https://github.com/marley-nodejs/Docker-and-Kubernetes-The-Complete-Guide-Local-Kubernetes-Only

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

    $ minikube docker-env
    export DOCKER_TLS_VERIFY="1"
    export DOCKER_HOST="tcp://192.168.99.117:2376"
    export DOCKER_CERT_PATH="/home/marley/.minikube/certs"
    export DOCKER_API_VERSION="1.35"
    # Run this command to configure your shell:
    # eval $(minikube docker-env)

<br/>

    $ eval $(minikube docker-env)
    $ docker ps

<br/>

## 14 A Multi-Container App with Kubernetes

<br/>

    $ minikube stop
    $ minikube delete
    $ minikube start

<br/>

![Application](/img/pic-14-01.png?raw=true)

<br/>

![Application](/img/pic-14-02.png?raw=true)

<br/>

**Persitence Volume && Persitence Volume Claims**

<br/>

![Application](/img/pic-14-03.png?raw=true)

![Application](/img/pic-14-04.png?raw=true)

<br/>

![Application](/img/pic-14-05.png?raw=true)

<br/>

![Application](/img/pic-14-06.png?raw=true)

<br/>

![Application](/img/pic-14-07.png?raw=true)

<br/>

![Application](/img/pic-14-08.png?raw=true)

<br/>

    // we will use default minikube storageclass
    $ kubectl get storageclass
    $ kubectl describe storageclass

<br/>

    $ cd 14_A_Multi_Container_App_with_Kubernetes

    $ kubectl apply -f .
    $ kubectl get pv
    $ kubectl get pvc

<br/>

**Environment Variables**

<br/>

![Application](/img/pic-14-09.png?raw=true)

<br/>

![Application](/img/pic-14-10.png?raw=true)

<br/>

**Secrets**

    $ kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf
    $ kubectl get secrets

<br/>

**Final**

    $ kubectl apply -f .

<br/>

## 15 Handling Traffic with Ingress Controllers

<br/>

    $ minikube addons enable ingress

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

    $ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml

https://kubernetes.github.io/ingress-nginx/deploy/#minikube

<br/>

    $ cd 15_Handling_Traffic_with_Ingress_Controllers/

    $ kubectl apply -f ingress-service.yaml

<br/>

    $ minikube ip
    192.168.99.100

https://192.168.99.100/

<br/>

![Application](/img/pic-15-05.png?raw=true)

<br/>

    $ minikube stop
    $ minikube delete

<br/>

## 16 Kubernetes Production Deployment

I will only watch. Do not want to pay for Google Clouds.

<a href="./16_Kubernetes_Production_Deployment/README.md">here</a>

<br/>

## 17 HTTPS Setup with Kubernetes

<a href="./17_HTTPS_Setup_with_Kubernetes/README.md">here</a>

<br/>

---

<br/>

**Marley**

Any questions on eng: https://jsdev.org/chat/  
Любые вопросы на русском: https://jsdev.ru/chat/
