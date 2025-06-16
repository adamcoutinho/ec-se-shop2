plugins {
    kotlin("jvm") version "1.9.22"
    war
}

group = "com.main.ep.website"
version = ""

repositories {
    mavenCentral()
}

dependencies {
    testImplementation("org.jetbrains.kotlin:kotlin-test")
    compileOnly("org.jetbrains.kotlin:kotlin-stdlib:1.5.30")
    compileOnly(project(path = ":website-server"))
    compileOnly(project(path = ":rack-api:rack-v1-customers"))
    compileOnly(project(path = ":rack-api:rack-v1-error-handler"))
    compileOnly(project(path = ":rack-db:rack-server-postgres"))
    compileOnly(project(":website-racks"))
    compileOnly("com.fasterxml.jackson.core:jackson-databind:2.16.2")

}

tasks.test {
    useJUnitPlatform()
}

kotlin {
    jvmToolchain(21)
}