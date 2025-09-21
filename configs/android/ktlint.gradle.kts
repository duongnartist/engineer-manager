plugins {
    id("org.jlleitschuh.gradle.ktlint") version "12.1.0"
    id("io.gitlab.arturbosch.detekt") version "1.23.4"
}

ktlint {
    version.set("1.2.1")
    android.set(true)
    ignoreFailures.set(false)
}

detekt {
    config.setFrom(files("$rootDir/config/android/detekt.yml"))
    buildUponDefaultConfig = true
}