FROM openjdk:17
VOLUME /tmp
EXPOSE 8080
ADD ./target/ProductCatalog-0.0.1-SNAPSHOT.jar EnterpriseStock.jar
ENTRYPOINT ["java", "-jar","/EnterpriseStock.jar"]