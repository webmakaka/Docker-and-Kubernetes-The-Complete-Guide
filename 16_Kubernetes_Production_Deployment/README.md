# [Stephen Grider] Docker and Kubernetes: The Complete Guide [2018, ENG]

<br/>

# 16 Kubernetes Production Deployment

I will only watch. Do not want to pay for Google Clouds.

console.cloud.google.com

<br/>

![Kubernetes Google Clouds](/img/pic-16-01.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-02.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-03.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-04.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-05.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-06.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-07.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-08.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-09.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-10.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-11.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-12.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-13.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-14.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-15.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-16.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-17.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-18.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-19.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-20.png?raw=true)

<br/>

### Encript google service account by travis

    $ docker run -it $(pwd):/app ruby:2.3 sh
    # cd app
    # gem install travis --no-rdoc --no-ri
    # travis login

    copy service-account.json to $(pwd)

    // !!! github account case sensitive
    # travis encrypt-file service-account.json -r marley-js/multi-k8s

    // !!!
    delete original service-account.json

    exit

<br/>

    push updated project with service-account.json.enc to github.

<br/>

![Kubernetes Google Clouds](/img/pic-16-21.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-22.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-23.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-24.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-25.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-26.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-27.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-28.png?raw=true)

<br/>

### Helm/Tiller

https://kubernetes.github.io/ingress-nginx/deploy/#using-helm

https://github.com/helm/helm

https://helm.sh/docs/using_helm/#from-script

    $ curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh
    $ chmod 700 get_helm.sh
    $ ./get_helm.sh

<br/>

![Kubernetes Google Clouds](/img/pic-16-29.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-30.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-31.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-32.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-33.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-34.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-35.png?raw=true)

<br/>

https://kubernetes.github.io/ingress-nginx/deploy/#using-helm

    $ helm install stable/nginx-ingress --name my-nginx --set rbac.create=true

<br/>

![Kubernetes Google Clouds](/img/pic-16-36.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-37.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-38.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-39.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-40.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-41.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-42.png?raw=true)

<br/>

![Kubernetes Google Clouds](/img/pic-16-43.png?raw=true)

<br/>

---

<br/>

**Marley**

Any questions on eng: https://jsdev.org/chat/  
Любые вопросы на русском: https://jsdev.ru/chat/
