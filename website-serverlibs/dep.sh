#!/bin/bash
rm -rf *.jar
#JDBC POSTGRES
wget https://repo1.maven.org/maven2/org/postgresql/postgresql/42.7.3/postgresql-42.7.3.jar
#HIBERNATE
wget https://repo1.maven.org/maven2/org/hibernate/orm/hibernate-core/6.4.4.Final/hibernate-core-6.4.4.Final.jar
wget https://repo1.maven.org/maven2/org/hibernate/common/hibernate-commons-annotations/6.0.6.Final/hibernate-commons-annotations-6.0.6.Final.jar
wget https://repo1.maven.org/maven2/org/jboss/logging/jboss-logging/3.5.3.Final/jboss-logging-3.5.3.Final.jar
wget https://repo1.maven.org/maven2/org/hibernate/validator/hibernate-validator/8.0.1.Final/hibernate-validator-8.0.1.Final.jar
wget https://repo1.maven.org/maven2/com/fasterxml/classmate/1.7.0/classmate-1.7.0.jar
wget https://repo1.maven.org/maven2/io/smallrye/jandex/3.1.7/jandex-3.1.7.jar
wget https://repo1.maven.org/maven2/net/bytebuddy/byte-buddy/1.14.12/byte-buddy-1.14.12.jar
#wget https://repo1.maven.org/maven2/org/antlr/antlr4/4.13.1/antlr4-4.13.1.jar
wget https://repo1.maven.org/maven2/org/antlr/antlr4-runtime/4.13.1/antlr4-runtime-4.13.1.jar
#<json serialize and deserialize>
wget https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-annotations/2.16.2/jackson-annotations-2.16.2.jar
wget https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.16.2/jackson-core-2.16.2.jar
wget https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.16.2/jackson-databind-2.16.2.jar
wget https://repo1.maven.org/maven2/com/fasterxml/jackson/module/jackson-module-kotlin/2.16.2/jackson-module-kotlin-2.16.2.jar
wget https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-yaml/2.16.2/jackson-dataformat-yaml-2.16.2.jar
#wget https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-xml/2.16.2/jackson-dataformat-xml-2.16.2.jar
wget https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-properties/2.16.2/jackson-dataformat-properties-2.16.2.jar
wget https://repo1.maven.org/maven2/com/fasterxml/jackson/datatype/jackson-datatype-jsr310/2.16.2/jackson-datatype-jsr310-2.16.2.jar
wget https://repo1.maven.org/maven2/com/fasterxml/jackson/datatype/jackson-datatype-jdk8/2.16.2/jackson-datatype-jdk8-2.16.2.jar
#</json serialize and deserialize>
#wget https://repo1.maven.org/maven2/org/codehaus/woodstox/stax2-api/4.2.2/stax2-api-4.2.2.jar
wget https://repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-reflect/1.9.23/kotlin-reflect-1.9.23.jar
wget https://repo1.maven.org/maven2/jakarta/servlet/jsp/jstl/jakarta.servlet.jsp.jstl-api/3.0.0/jakarta.servlet.jsp.jstl-api-3.0.0.jar
wget https://repo.maven.apache.org/maven2/org/glassfish/web/jakarta.servlet.jsp.jstl/3.0.1/jakarta.servlet.jsp.jstl-3.0.1.jar
wget https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/6.0.0/jakarta.servlet-api-6.0.0.jar
wget https://repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-stdlib/1.9.22/kotlin-stdlib-1.9.22.jar
wget https://repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-stdlib-jdk8/1.9.22/kotlin-stdlib-jdk8-1.9.22.jar
wget https://repo1.maven.org/maven2/org/apache/commons/commons-lang3/3.14.0/commons-lang3-3.14.0.jar
wget https://repo1.maven.org/maven2/jakarta/transaction/jakarta.transaction-api/2.0.1/jakarta.transaction-api-2.0.1.jar
wget https://repo1.maven.org/maven2/jakarta/servlet/jsp/jakarta.servlet.jsp-api/3.1.1/jakarta.servlet.jsp-api-3.1.1.jar
wget https://repo1.maven.org/maven2/jakarta/platform/jakarta.jakartaee-api/10.0.0/jakarta.jakartaee-api-10.0.0.jar
wget https://repo1.maven.org/maven2/commons-logging/commons-logging/1.3.0/commons-logging-1.3.0.jar
#librarys spring
VERSION_SPRING_FRAMEWORK=6.1.3
wget https://repo1.maven.org/maven2/org/springframework/batch/spring-batch-core/5.1.0/spring-batch-core-5.1.0.jar
wget https://repo1.maven.org/maven2/org/springframework/spring-webmvc/6.1.3/spring-webmvc-6.1.3.jar
wget https://repo1.maven.org/maven2/org/springframework/spring-context/6.1.3/spring-context-6.1.3.jar
wget https://repo1.maven.org/maven2/org/springframework/spring-beans/6.1.3/spring-beans-6.1.3.jar
wget https://repo1.maven.org/maven2/org/springframework/spring-web/6.1.3/spring-web-6.1.3.jar
wget https://repo1.maven.org/maven2/org/springframework/spring-core/6.1.3/spring-core-6.1.3.jar
wget https://repo1.maven.org/maven2/org/springframework/spring-aop/6.1.3/spring-aop-6.1.3.jar
wget https://repo1.maven.org/maven2/org/springframework/spring-context-support/6.1.3/spring-context-support-6.1.3.jar
wget https://repo1.maven.org/maven2/org/springframework/spring-expression/6.1.3/spring-expression-6.1.3.jar
wget https://repo1.maven.org/maven2/org/springframework/spring-test/6.1.3/spring-test-6.1.3.jar
wget https://repo1.maven.org/maven2/org/springframework/spring-jdbc/6.1.3/spring-jdbc-6.1.3.jar
wget https://repo1.maven.org/maven2/org/springframework/spring-orm/6.1.3/spring-orm-6.1.3.jar
wget https://repo1.maven.org/maven2/org/springframework/spring-tx/6.1.3/spring-tx-6.1.3.jar
#libraries spring dependency
wget https://repo1.maven.org/maven2/org/eclipse/yasson/3.0.3/yasson-3.0.3.jar
wget https://repo1.maven.org/maven2/org/eclipse/parsson/parsson/1.1.5/parsson-1.1.5.jar
wget https://repo1.maven.org/maven2/io/micrometer/micrometer-observation/1.12.2/micrometer-observation-1.12.2.jar
wget https://repo1.maven.org/maven2/io/micrometer/micrometer-core/1.12.2/micrometer-core-1.12.2.jar
wget https://repo1.maven.org/maven2/io/micrometer/micrometer-commons/1.12.2/micrometer-commons-1.12.2.jar
#SPRING DATA
wget https://repo1.maven.org/maven2/org/springframework/data/spring-data-jpa/3.2.4/spring-data-jpa-3.2.4.jar
wget https://repo1.maven.org/maven2/org/springframework/data/spring-data-commons/3.2.4/spring-data-commons-3.2.4.jar
