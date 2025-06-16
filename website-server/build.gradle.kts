plugins {
    kotlin("jvm")
}

group = "com.main.ep.website.server"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
//    testImplementation("org.jetbrains.kotlin:kotlin-test")

    // recognizer jsp
    runtimeOnly("org.apache.taglibs:taglibs-standard-impl:1.2.5")
//    implementation("org.apache.tomcat:tomcat-jsp-api:11.0.0-M15")
//    implementation("org.apache.tomcat:tomcat-servlet-api:11.0.0-M15")
//    implementation("org.apache.commons:commons-lang3:3.14.0")
//    implementation("org.apache.tomcat:tomcat-jasper:11.0.0-M15")
//    implementation("org.springframework:spring-webmvc:6.1.3")
//    implementation("jakarta.transaction:jakarta.transaction-api:2.0.1")
//    implementation("org.tuckey:urlrewritefilter:5.1.3")
    compileOnly("jakarta.servlet.jsp:jakarta.servlet.jsp-api:3.1.1")
    compileOnly("jakarta.servlet:jakarta.servlet-api:6.0.0")
//    compileOnly("jakarta.platform:jakarta.jakartaee-api:10.0.0")
    implementation(libs.spring.web)
    implementation(libs.spring.webmvc)
    implementation(libs.spring.context)
    implementation(libs.jackson.databind)
    implementation(libs.micrometer.core)
    implementation(libs.micrometer.commons)
    implementation(libs.jakarta.validation.api)
    implementation(libs.kotlin.test)

}

tasks.test {
    useJUnitPlatform()
}
kotlin {
    jvmToolchain(21)
}