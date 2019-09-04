#!/usr/bin/env groovy

node {
    stage('checkout') {
        checkout scm
    }

    stage('check java') {
        sh ". /Users/kulsharm2/.bashrc && java -version"
    }

    stage('Install NPM') {
        sh "npm install -g generator-jhipster yo@latest"
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
