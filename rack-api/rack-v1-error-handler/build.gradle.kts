plugins {
    kotlin("jvm") version "1.9.22"
}

//group = "com.main.ep.rack.v1.error.handler"
//version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

val SpringFrameworkVersion = properties["SpringFrameworkVersion"]
val IOmicrometerVersion = properties["IOmicrometerVersion"]
val JacksonDataBindVersion = properties["JacksonDataBindVersion"]
dependencies {
    implementation(libs.spring.web)
    implementation(libs.spring.webmvc)
    implementation(libs.spring.context)
    implementation(libs.jackson.databind)
    implementation(libs.micrometer.core)
    implementation(libs.micrometer.commons)
    implementation(libs.jakarta.validation.api)
    implementation(libs.kotlin.test)
    implementation(project(":core"))
}
tasks.test {
    useJUnitPlatform()
}
kotlin {
    jvmToolchain(21)
}