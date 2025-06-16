plugins {
    kotlin("jvm") version "1.9.22"
}

group = "com.main.ep.rack.db.postgres"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}
val SpringFrameworkVersion = properties["SpringFrameworkVersion"]
val IOmicrometerVersion = properties["IOmicrometerVersion"]
val JacksonDataBindVersion = properties["JacksonDataBindVersion"]
dependencies {
    testImplementation("org.jetbrains.kotlin:kotlin-test")
    implementation("org.springframework:spring-orm:$SpringFrameworkVersion")
    implementation("org.springframework:spring-jdbc:$SpringFrameworkVersion")
    implementation("jakarta.persistence:jakarta.persistence-api:3.1.0")
    implementation("jakarta.validation:jakarta.validation-api:3.0.2")
    implementation(project(":core"))

//    implementation("org.hibernate.orm:hibernate-core:6.4.4.Final")
//
//    implementation("org.hibernate.validator:hibernate-validator:8.0.1.Final")
    implementation("org.springframework.data:spring-data-commons:3.2.4")
    implementation("org.springframework.data:spring-data-jpa:3.2.4")

    implementation("org.postgresql:postgresql:42.7.3")




}

tasks.test {
    useJUnitPlatform()
}
kotlin {
    jvmToolchain(21)
}