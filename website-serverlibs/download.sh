#!/bin/bash

# Enhanced Java Dependencies Download Script
# Downloads JAR files for Spring Framework, Hibernate, Jackson, and other dependencies

set -euo pipefail  # Exit on error, undefined variables, and pipe failures

# Configuration
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly LIB_DIR="${SCRIPT_DIR}/lib"
readonly LOG_FILE="${SCRIPT_DIR}/download.log"
readonly MAVEN_REPO="https://repo1.maven.org/maven2"

# Version configurations (centralized for easy updates)
readonly SPRING_VERSION="6.1.3"
readonly HIBERNATE_VERSION="6.4.4.Final"
readonly JACKSON_VERSION="2.16.2"
readonly KOTLIN_VERSION="1.9.23"
readonly POSTGRES_VERSION="42.7.3"

# Colors for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# Logging functions
log() {
    echo -e "${BLUE}[INFO]${NC} $1" | tee -a "$LOG_FILE"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1" | tee -a "$LOG_FILE"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" | tee -a "$LOG_FILE"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1" | tee -a "$LOG_FILE"
}

# Function to download a JAR file with retry logic
download_jar() {
    local group_path="$1"
    local artifact="$2"
    local version="$3"
    local jar_name="${artifact}-${version}.jar"
    local url="${MAVEN_REPO}/${group_path}/${artifact}/${version}/${jar_name}"
    local output_file="${LIB_DIR}/${jar_name}"
    
    # Skip if file already exists and is not empty
    if [[ -f "$output_file" && -s "$output_file" ]]; then
        log "Skipping $jar_name (already exists)"
        return 0
    fi
    
    log "Downloading $jar_name..."
    
    # Retry logic
    local max_retries=3
    local retry_count=0
    
    while [[ $retry_count -lt $max_retries ]]; do
        if wget --timeout=30 --tries=1 -q "$url" -O "$output_file"; then
            # Verify download
            if [[ -s "$output_file" ]]; then
                success "Downloaded $jar_name"
                return 0
            else
                warn "Downloaded file is empty: $jar_name"
                rm -f "$output_file"
            fi
        fi
        
        ((retry_count++))
        if [[ $retry_count -lt $max_retries ]]; then
            warn "Download failed for $jar_name, retrying ($retry_count/$max_retries)..."
            sleep 2
        fi
    done
    
    error "Failed to download $jar_name after $max_retries attempts"
    return 1
}

# Function to clean up old JAR files
cleanup_old_jars() {
    log "Cleaning up old JAR files..."
    if [[ -d "$LIB_DIR" ]]; then
        find "$LIB_DIR" -name "*.jar" -type f -delete
        success "Cleaned up old JAR files"
    fi
}

# Function to create directory structure
setup_directories() {
    log "Setting up directory structure..."
    mkdir -p "$LIB_DIR"
    success "Directory structure ready"
}

# Function to download PostgreSQL JDBC driver
download_postgres() {
    log "=== Downloading PostgreSQL JDBC Driver ==="
    download_jar "org/postgresql/postgresql" "postgresql" "$POSTGRES_VERSION"
}

# Function to download Hibernate dependencies
download_hibernate() {
    log "=== Downloading Hibernate Dependencies ==="
    local deps=(
        "org/hibernate/orm/hibernate-core:hibernate-core:${HIBERNATE_VERSION}"
        "org/hibernate/common/hibernate-commons-annotations:hibernate-commons-annotations:6.0.6.Final"
        "org/jboss/logging/jboss-logging:jboss-logging:3.5.3.Final"
        "org/hibernate/validator/hibernate-validator:hibernate-validator:8.0.1.Final"
        "com/fasterxml/classmate:classmate:1.7.0"
        "io/smallrye/jandex:jandex:3.1.7"
        "net/bytebuddy/byte-buddy:byte-buddy:1.14.12"
        "org/antlr/antlr4-runtime:antlr4-runtime:4.13.1"
        "jakarta/transaction/jakarta.transaction-api:jakarta.transaction-api:2.0.1"
    )
    
    for dep in "${deps[@]}"; do
        IFS=':' read -r group_path artifact version <<< "$dep"
        download_jar "$group_path" "$artifact" "$version"
    done
}

# Function to download Jackson JSON processing libraries
download_jackson() {
    log "=== Downloading Jackson JSON Libraries ==="
    local deps=(
        "com/fasterxml/jackson/core/jackson-annotations:jackson-annotations:${JACKSON_VERSION}"
        "com/fasterxml/jackson/core/jackson-core:jackson-core:${JACKSON_VERSION}"
        "com/fasterxml/jackson/core/jackson-databind:jackson-databind:${JACKSON_VERSION}"
        "com/fasterxml/jackson/module/jackson-module-kotlin:jackson-module-kotlin:${JACKSON_VERSION}"
        "com/fasterxml/jackson/dataformat/jackson-dataformat-yaml:jackson-dataformat-yaml:${JACKSON_VERSION}"
        "com/fasterxml/jackson/dataformat/jackson-dataformat-properties:jackson-dataformat-properties:${JACKSON_VERSION}"
        "com/fasterxml/jackson/datatype/jackson-datatype-jsr310:jackson-datatype-jsr310:${JACKSON_VERSION}"
        "com/fasterxml/jackson/datatype/jackson-datatype-jdk8:jackson-datatype-jdk8:${JACKSON_VERSION}"
    )
    
    for dep in "${deps[@]}"; do
        IFS=':' read -r group_path artifact version <<< "$dep"
        download_jar "$group_path" "$artifact" "$version"
    done
}

# Function to download Spring Framework dependencies
download_spring() {
    log "=== Downloading Spring Framework Dependencies ==="
    local deps=(
        "org/springframework/batch/spring-batch-core:spring-batch-core:5.1.0"
        "org/springframework/spring-webmvc:spring-webmvc:${SPRING_VERSION}"
        "org/springframework/spring-context:spring-context:${SPRING_VERSION}"
        "org/springframework/spring-beans:spring-beans:${SPRING_VERSION}"
        "org/springframework/spring-web:spring-web:${SPRING_VERSION}"
        "org/springframework/spring-core:spring-core:${SPRING_VERSION}"
        "org/springframework/spring-aop:spring-aop:${SPRING_VERSION}"
        "org/springframework/spring-context-support:spring-context-support:${SPRING_VERSION}"
        "org/springframework/spring-expression:spring-expression:${SPRING_VERSION}"
        "org/springframework/spring-test:spring-test:${SPRING_VERSION}"
        "org/springframework/spring-jdbc:spring-jdbc:${SPRING_VERSION}"
        "org/springframework/spring-orm:spring-orm:${SPRING_VERSION}"
        "org/springframework/spring-tx:spring-tx:${SPRING_VERSION}"
    )
    
    for dep in "${deps[@]}"; do
        IFS=':' read -r group_path artifact version <<< "$dep"
        download_jar "$group_path" "$artifact" "$version"
    done
}

# Function to download Spring Data dependencies
download_spring_data() {
    log "=== Downloading Spring Data Dependencies ==="
    local deps=(
        "org/springframework/data/spring-data-jpa:spring-data-jpa:3.2.4"
        "org/springframework/data/spring-data-commons:spring-data-commons:3.2.4"
    )
    
    for dep in "${deps[@]}"; do
        IFS=':' read -r group_path artifact version <<< "$dep"
        download_jar "$group_path" "$artifact" "$version"
    done
}

# Function to download supporting libraries
download_supporting_libs() {
    log "=== Downloading Supporting Libraries ==="
    local deps=(
        "org/jetbrains/kotlin/kotlin-reflect:kotlin-reflect:${KOTLIN_VERSION}"
        "org/jetbrains/kotlin/kotlin-stdlib:kotlin-stdlib:1.9.22"
        "org/jetbrains/kotlin/kotlin-stdlib-jdk8:kotlin-stdlib-jdk8:1.9.22"
        "jakarta/servlet/jsp/jstl/jakarta.servlet.jsp.jstl-api:jakarta.servlet.jsp.jstl-api:3.0.0"
        "org/glassfish/web/jakarta.servlet.jsp.jstl:jakarta.servlet.jsp.jstl:3.0.1"
        "jakarta/servlet/jakarta.servlet-api:jakarta.servlet-api:6.0.0"
        "jakarta/servlet/jsp/jakarta.servlet.jsp-api:jakarta.servlet.jsp-api:3.1.1"
        "jakarta/platform/jakarta.jakartaee-api:jakarta.jakartaee-api:10.0.0"
        "org/apache/commons/commons-lang3:commons-lang3:3.14.0"
        "commons-logging/commons-logging:commons-logging:1.3.0"
        "org/eclipse/yasson:yasson:3.0.3"
        "org/eclipse/parsson:parsson:1.1.5"
        "io/micrometer/micrometer-observation:micrometer-observation:1.12.2"
        "io/micrometer/micrometer-core:micrometer-core:1.12.2"
        "io/micrometer/micrometer-commons:micrometer-commons:1.12.2"
    )
    
    for dep in "${deps[@]}"; do
        IFS=':' read -r group_path artifact version <<< "$dep"
        download_jar "$group_path" "$artifact" "$version"
    done
}

# Function to generate classpath
generate_classpath() {
    log "Generating classpath file..."
    local classpath_file="${SCRIPT_DIR}/classpath.txt"
    
    if [[ -d "$LIB_DIR" ]]; then
        find "$LIB_DIR" -name "*.jar" -type f | sort > "$classpath_file"
        local jar_count=$(wc -l < "$classpath_file")
        success "Generated classpath with $jar_count JAR files: $classpath_file"
    else
        error "Library directory not found: $LIB_DIR"
        return 1
    fi
}

# Function to show summary
show_summary() {
    log "=== Download Summary ==="
    if [[ -d "$LIB_DIR" ]]; then
        local jar_count=$(find "$LIB_DIR" -name "*.jar" -type f | wc -l)
        local total_size=$(du -sh "$LIB_DIR" 2>/dev/null | cut -f1 || echo "Unknown")
        success "Downloaded $jar_count JAR files"
        success "Total size: $total_size"
        success "Location: $LIB_DIR"
    fi
}

# Main execution function
main() {
    log "Starting dependency download process..."
    log "Timestamp: $(date)"
    
    # Check prerequisites
    if ! command -v wget &> /dev/null; then
        error "wget is required but not installed. Please install wget first."
        exit 1
    fi
    
    # Setup
    setup_directories
    
    # Clean up if requested
    if [[ "${1:-}" == "--clean" ]]; then
        cleanup_old_jars
    fi
    
    # Download dependencies
    local failed_downloads=0
    
    download_postgres || ((failed_downloads++))
    download_hibernate || ((failed_downloads++))
    download_jackson || ((failed_downloads++))
    download_spring || ((failed_downloads++))
    download_spring_data || ((failed_downloads++))
    download_supporting_libs || ((failed_downloads++))
    
    # Generate classpath and show summary
    generate_classpath
    show_summary
    
    # Final status
    if [[ $failed_downloads -eq 0 ]]; then
        success "All dependencies downloaded successfully!"
        exit 0
    else
        warn "Download completed with $failed_downloads failed category(ies)"
        warn "Check $LOG_FILE for details"
        exit 1
    fi
}

# Help function
show_help() {
    cat << EOF
Usage: $0 [OPTIONS]

Download Java dependencies for Spring Framework, Hibernate, and related libraries.

OPTIONS:
    --clean     Clean up old JAR files before downloading
    --help      Show this help message

The script will:
1. Create a 'lib' directory for JAR files
2. Download all required dependencies
3. Generate a classpath.txt file
4. Create a download.log file for troubleshooting

Dependencies include:
- PostgreSQL JDBC Driver
- Hibernate ORM and related libraries
- Jackson JSON processing libraries
- Spring Framework core libraries
- Spring Data JPA
- Supporting libraries (Kotlin, Jakarta EE, Commons, etc.)

EOF
}

# Script entry point
if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
    show_help
    exit 0
fi

# Run main function
main "$@"