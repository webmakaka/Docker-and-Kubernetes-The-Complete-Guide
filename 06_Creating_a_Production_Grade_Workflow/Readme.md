    $ npx create-react-app frontend
    $ cd frontend

<br/>

    $ docker build -f Dockerfile.dev .
    $ docker run -p 3000:3000 -v /app/node_modules -v $(pwd):/app 5a9f799f3564

<br/>

    $ docker-compose up --build

<br/>

**Final:**

    $ docker build .
    $ docker run -p 8080:80 176a084c3114
