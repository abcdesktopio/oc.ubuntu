# oc.ubuntu

## To get more informations

Please, read the public documentation web site:
* [https://www.abcdesktop.io](https://www.abcdesktop.io)
* [https://abcdesktopio.github.io/](https://abcdesktopio.github.io/)


## To build oc.ubuntu.xx.xx

```
git clone https://github.com/abcdesktopio/oc.ubuntu.git
```

## To build oc.ubuntu.18.04

oc.ubuntu.18.04 use the debian package from abcdesktopio/openbox
openbox debian packages exist for releases 18.04
Build process load metadata from docker.io/abcdesktopio/openbox:18.04

### abcdesktopio/openbox:18.04 for linux/arm/v7

```
docker buildx build --platform linux/arm/v7 --tag abcdesktopio/oc.ubuntu.18.04:dev --build-arg BUILDPLATFORM=linux/arm/v7 --build-arg BASE_IMAGE_RELEASE=18.04 --build-arg BASE_IMAGE=ubuntu:18.04 .
```

### abcdesktopio/openbox:18.04 for linux/arm64

```
docker buildx build --platform linux/arm64 --tag abcdesktopio/oc.ubuntu.18.04:dev --build-arg BUILDPLATFORM=linux/arm64 --build-arg BASE_IMAGE_RELEASE=18.04 --build-arg BASE_IMAGE=ubuntu:18.04 .
```

### abcdesktopio/openbox:18.04 for linux/amd64

```
docker buildx build --platform linux/amd64 --tag abcdesktopio/oc.ubuntu.18.04:dev --build-arg BUILDPLATFORM=linux/amd64 --build-arg BASE_IMAGE_RELEASE=18.04 --build-arg BASE_IMAGE=ubuntu:18.04 .
```

## To build oc.ubuntu.20.04

oc.ubuntu.20.04 use the debian package from abcdesktopio/openbox
openbox debian packages exist for release 20.04
Build process load metadata from docker.io/abcdesktopio/openbox:20.04

### abcdesktopio/openbox:20.04 for linux/arm/v7

```
docker buildx build --platform linux/arm/v7 --tag abcdesktopio/oc.ubuntu.20.04:dev --build-arg BUILDPLATFORM=linux/arm/v7 --build-arg BASE_IMAGE_RELEASE=20.04 --build-arg BASE_IMAGE=ubuntu:20.04 .
```

### abcdesktopio/openbox:20.04 for linux/arm64

```
docker buildx build --platform linux/arm64 --tag abcdesktopio/oc.ubuntu.20.04:dev --build-arg BUILDPLATFORM=linux/arm64 --build-arg BASE_IMAGE_RELEASE=20.04 --build-arg BASE_IMAGE=ubuntu:20.04 .
```

### abcdesktopio/openbox:20.04 for linux/amd64

```
docker buildx build --platform linux/amd64 --tag abcdesktopio/oc.ubuntu.20.04:dev --build-arg BUILDPLATFORM=linux/amd64 --build-arg BASE_IMAGE_RELEASE=20.04 --build-arg BASE_IMAGE=ubuntu:20.04 .
```

## To build oc.ubuntu.21.04

oc.ubuntu.21.04 use the debian package from abcdesktopio/openbox
openbox debian packages exist for release 21.04
Build process load metadata from docker.io/abcdesktopio/openbox:21.04

### abcdesktopio/openbox:21.04 for linux/arm/v7
```
docker buildx build --platform linux/arm/v7 --tag abcdesktopio/oc.ubuntu.21.04:dev --build-arg BUILDPLATFORM=linux/arm/v7 --build-arg BASE_IMAGE_RELEASE=21.04 --build-arg BASE_IMAGE=ubuntu:21.04 .
```

### abcdesktopio/openbox:21.04 for linux/arm64
```
docker buildx build --platform linux/arm64 --tag abcdesktopio/oc.ubuntu.21.04:dev --build-arg BUILDPLATFORM=linux/arm64 --build-arg BASE_IMAGE_RELEASE=21.04 --build-arg BASE_IMAGE=ubuntu:21.04 .
```
### abcdesktopio/openbox:21.04 for linux/amd64
```
docker buildx build --platform linux/amd64 --tag abcdesktopio/oc.ubuntu.21.04:dev --build-arg BUILDPLATFORM=linux/amd64 --build-arg BASE_IMAGE_RELEASE=21.04 --build-arg BASE_IMAGE=ubuntu:21.04 .
```
