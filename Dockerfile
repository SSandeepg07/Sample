FROM java:8
LABEL maintainer="deelogan@cisco.com"
LABEL version="1.0"

ARG JAR

RUN mkdir "/apps"

ADD ./target/${JAR} /apps/app.jar

EXPOSE 9090

ENTRYPOINT ["java","-jar","/apps/app.jar"]

