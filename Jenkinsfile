#!/usr/bin/env groovy

node {
    stage('checkout') {
        checkout scm
    }

    stage('check java') {
        sh "java -version"
    }

    stage('quality analysis') {
        withSonarQubeEnv('http://localhost:9001') {
        }
    }
}
