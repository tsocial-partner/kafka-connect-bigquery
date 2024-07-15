# How to build image

## Compile and package jar files

```shell
cd /path/to/kafka-connect-bigquery/
mvn clean package -DskipTests

$ mkdir -p bin/jar/ && cp kcbq-connector/target/components/packages/wepay-kafka-connect-bigquery-*/wepay-kafka-connect-bigquery-*/lib/*.jar bin/jar/
```

## Build image

### Build local image
```shell
IMAGE_NAME="kafka-connect-bq"
IMAGE_VER="v1.0"

docker build -t ${IMAGE_NAME}:${IMAGE_VER} .
```

### Publish image to TS's registry
```shell
IMAGE_NAME="kafka-connect-bq"
IMAGE_VER="v1.0"

docker tag ${IMAGE_NAME}:${IMAGE_VER} registry.trustingsocial.com/de/${IMAGE_NAME}:${IMAGE_VER}
docker push registry.trustingsocial.com/de/${IMAGE_NAME}:${IMAGE_VER}
```