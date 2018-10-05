FROM java:8

ARG JAR

VOLUME ["/apps"]

ADD ./target/${JAR} /apps/app.jar

EXPOSE 9090

ENTRYPOINT ["java","-jar","/apps/app.jar"]

