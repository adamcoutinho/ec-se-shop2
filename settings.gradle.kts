plugins {
    id("org.gradle.toolchains.foojay-resolver-convention") version "0.5.0"
}
rootProject.name = "enterprise-platform"
include("website")
include("core")
include("website-server")
include("rack-api:rack-v1-customers")
findProject(":rack-api:rack-v1-customers")?.name = "rack-v1-customers"
include("rack-api:rack-v1-error-handler")
findProject(":rack-api:rack-v1-error-handler")?.name = "rack-v1-error-handler"
include("website-racks")
include("rack-db")
include("rack-db:rack-server-postgres")
findProject(":rack-db:rack-server-postgres")?.name = "rack-server-postgres"
