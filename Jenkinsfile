pipeline {
    agent any

stages {
    
/*    
stage('checkout') {
        steps {
                //enable remote triggers
                script {
                    properties([pipelineTriggers([pollSCM('')])])
                }
                //define scm connection for polling
                checkout scm
                git branch: master, url: 'https://github.com/vikchallenge/umsl'
        }
//        checkout scm
        //git poll: true, url: 'https://github.com/vikchallenge/umsl'
    }
 */

    stage('check java') {
        steps {
            sh "export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home && java -version"
        }
    }

    stage('Install NPM') {
        steps {
            sh "/usr/local/bin/npm install  generator-jhipster yo@latest"
        }
    }

    stage('Packaging') {
        steps {
            sh "./mvnw -Pprod clean verify"
        }
    }
/*
    stage('Testing') {
        steps {
            sh "./mvnw verify"
        }
    }
 */   stage('Just for Testing') {
        steps {
            sh "export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home && java -jar $WORKSPACE/target/*.jar"
        }
    }
}

}
