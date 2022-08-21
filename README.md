This is my learning content for Docker.

# ds-env

“ds-env” is extremely simple tutorial of Docker.

Example：

![DS Diagram(AWS)](https://user-images.githubusercontent.com/111184429/185786970-3e7378dd-f978-40d0-9e64-c836d56a0608.png)

# Useage on Local

1. Clone this repository
```
$ git clone https://github.com/koiwas/ds-env.git
```
```
$ cd ~/ds-env
```

2. Build Dockerimage (for M1 Mac)
```
$ docker build --platform linux/amd64 .
```
```
$ docker images
```

3. Run Dockerimage
```
$ docker run -p 8888:8888 -v ~/ds_work:/work --name {container-name} {image}
```

4. Access 'localhost:8888' !!!

# Useage on AWS

1. Launch Instance

> * Instance type:t2.micro
> * Storage：20GiB
> * Create a new key-pair

2. Setup Docker on AWS
```
$ chmod 400 {key-pair}
```
```
$ ssh -i {key-pair} ubuntu@hostname
```
```
$ sudo apt-get update
```
```
$ sudo apt-get install docker.io
```
```
$ sudo gpasswd -a ubuntu docker
```
```
$ mkdir dsenv_build
```
```
$ exit
```

3. Upload & Build Dockerfile

```
$ sftp -i {key-pair} ubuntu@hostname
```
```
$ put {local/path} ~/dsenv_build
```
```
$ exit
```
```
$ ssh -i {key-pair} ubuntu@hostname
```
```
$ cd ~/dsenv_build
```
```
$ docker build .
```

4. Run Dockerimage

```
$ docker images
```
```
$ docker run -v ~/ds_work:/work -p 8888:8888 {image}
```

5. Access 'Public DNS:8888' !!!
