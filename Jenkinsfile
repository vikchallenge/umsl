#!/usr/bin/env groovy

node {
    git poll: true, url: 'https://github.com/vikchallenge/umsl'
    
    stage('checkout') {
        checkout scm
    }

    stage('check java') {
        sh "export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home && java -version"
    }

    stage('Install NPM') {
        sh "/usr/local/bin/npm install  generator-jhipster yo@latest"
    }

    stage('Packaging') {
        sh "./mvnw -Pprod clean verify"
    }

    stage('Testing') {
        sh "./mvnw verify"
    }

}
