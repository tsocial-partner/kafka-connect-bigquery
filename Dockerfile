FROM --platform=linux/amd64 eclipse-temurin:11.0.20.1_1-jre-centos7

ENV CONFLUENT_VER=7.5
ENV CONFLUENT_MIRROR_VER=7.5.4

RUN curl -k -sSL https://packages.confluent.io/archive/${CONFLUENT_VER}/confluent-${CONFLUENT_MIRROR_VER}.tar.gz -o /tmp/confluent-${CONFLUENT_MIRROR_VER}.tar.gz \
    && mkdir /app \
    && tar -xzf /tmp/confluent-${CONFLUENT_MIRROR_VER}.tar.gz -C /app \
    && rm -f /tmp/confluent-${CONFLUENT_MIRROR_VER}.tar.gz

WORKDIR /app
COPY ./bin/jar jar

ENV CONFLUENT_DIR=/app/confluent-${CONFLUENT_MIRROR_VER}
ENV CLASSPATH="${CLASSPATH}:/app/jar/*"

CMD ["/bin/sh", "-c", "/app/confluent-${CONFLUENT_MIRROR_VER}/bin/connect-standalone /app/properties/standalone.properties /app/properties/connector.properties"]