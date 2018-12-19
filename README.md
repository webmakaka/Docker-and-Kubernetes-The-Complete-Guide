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

    $ cd 01-complex/client/
    $ docker build -f Dockerfile.dev .
    Successfully built 05efd9c2ea0c

    $ cd ../server/
    $ docker build -f Dockerfile.dev .
    Successfully built 2a1c5f2e40a7

    $ cd ../worker/
    $ docker build -f Dockerfile.dev .
    Successfully built 772a168e89a0


<br/>

![Application](/img/pic-09-04.png?raw=true)

<br/>

![Application](/img/pic-09-05.png?raw=true)

<br/>

![Application](/img/pic-09-06.png?raw=true)


        $ docker-compose up --build

<br/>

![Application](/img/pic-09-07.png?raw=true)


http://localhost:8080/api/values/current


```shell
$ docker-compose ps
        Name                     Command            State          Ports        
--------------------------------------------------------------------------------
01-complex_api_1        npm run dev                 Up                          
01-complex_client_1     npm run start               Up                          
01-complex_nginx_1      nginx -g daemon off;        Up      0.0.0.0:8080->80/tcp
01-complex_postgres_1   docker-entrypoint.sh        Up      5432/tcp            
                        postgres                                                
01-complex_redis_1      docker-entrypoint.sh        Up      6379/tcp            
                        redis ...                                               
01-complex_worker_1     npm run dev                 Up                          
```

<br/>

## 10 A Continuous Integration Workflow for Multiple Images

   Travis-ci.org -> Environment Vaiables

   DOCKER_ID  
   DOCKER_PASSWORD


DID NOT TEST !!!


<br/>

### 11 Multi-Container Deployments to AWS

AWS is not interesting for me

<br/>

### 12 Onwards to Kubernetes

    $ kubectl apply -f client-pod.yaml
    $ kubectl apply -f client-node-pod.yaml

    $ kubectl get pods
    NAME         READY   STATUS    RESTARTS   AGE
    client-pod   1/1     Running   0          1m

    $ kubectl get services
    NAME               TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
    client-node-port   NodePort    10.100.19.35   <none>        3050:31515/TCP   10m
    kubernetes         ClusterIP   10.96.0.1      <none>        443/TCP          2h


    $ minikube ip
    192.168.99.100

    http://192.168.99.100:31515/


<br/>

## 13 Maintaining Sets of Containers with Deployments

    $ kubectl apply -f client-pod.yaml
    $ kubectl get pods
    $ kubectl describe pod client-pod

    $ kubectl delete -f client-pod.yaml
    $ kubectl get pods

    $ kubectl apply -f client-deployment.yaml
    $ kubectl get pods
    $ kubectl get deployments
    NAME                DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
    client-deployment   1         1         1            1           1m
    
    $ minikube ip
    192.168.99.100

http://192.168.99.100:31515/

    $ kubectl get pods -o wide
    NAME                                 READY   STATUS    RESTARTS   AGE   IP           NODE
    client-deployment-588947887b-lkqsc   1/1     Running   0          8m    172.17.0.7   minikube


<br/>

set replicas: 5


    $ kubectl get deployments
    NAME                DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
    client-deployment   5         6         5            4           20m

    $ kubectl get pods
    NAME                                READY   STATUS    RESTARTS   AGE
    client-deployment-9b8bffb65-gzjzg   1/1     Running   0          37s
    client-deployment-9b8bffb65-mmkwt   1/1     Running   0          43s
    client-deployment-9b8bffb65-pj8rd   1/1     Running   0          43s
    client-deployment-9b8bffb65-w8tn7   1/1     Running   0          39s
    client-deployment-9b8bffb65-xhl9j   1/1     Running   0          43s

<br/>

Update container:

    $ kubectl set image deployment/client-deployment client=stephengrider/multi-client:v5

Reconfiguring Docker CLI

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