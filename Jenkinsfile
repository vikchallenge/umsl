#!/usr/bin/env groovy

node {
    environment{
//        JAVA_HOME = '/Library/Java/JavaVirtualMachines/jdk1.8.0_212.jdk/Contents/Home'
        //        ANDROID_HOME = '/Users/devops/Library/Android/sdk'
//        scannerHome = "/Users/devops/sonar/sonar-scanner-3.3.0.1492-macosx"
//        VERSION_CODE="${BUILD_NUMBER}"
         PATH="$PATH:/usr/local/bin/"       
    }
    stage('checkout') {
        checkout scm
    }

    stage('check java') {
        sh "export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home && java -version"
    }

    stage('Install NPM') {
        sh 'echo $PATH'
        sh "PATH="$PATH:/usr/local/bin" && /usr/local/bin/npm install -g generator-jhipster yo@latest"
    }

    stage('Packaging') {
        sh "./mvnw -Pprod clean verify"
    }

    stage('Testing') {
        sh "./mvnw verify"
    }

    stage('Code quality') {
        sh "docker-compose -f src/main/docker/sonar.yml up -d"
        sh "./mvnw -Pprod clean verify sonar:sonar"
        sh "./mvnw initialize sonar:sonar"
    }

   stage('quality analysis') {
        withSonarQubeEnv('http://localhost:9001') {
        }
    }
}
