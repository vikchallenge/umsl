pipeline {
    agent any

stages {
    
    stage('check java') {
        steps {
            sh "export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home && java -version"
        }
    }

    stage('Install jhipster') {
        steps {
            sh "/usr/bin/npm install  generator-jhipster yo@latest"
            
        }
    }

    stage('Packaging') {
        steps {
            sh "./mvnw -Pprod clean verify"
        }
    }
	
	stage('Upload to S3') {

        dir('$WORKSPACE/target/'){

            pwd(); //Log current directory

            withAWS(region:'ap-south-1',credentials:'iamuser-student') {

                 def identity=awsIdentity();//Log AWS credentials

                // Upload files from working directory 'dist' in your project workspace
                s3Upload(bucket:"case000", workingDir:'dist', includePathPattern:'**/*');
            }

        };
    }
	
   /*stage('Downlaod and Deploy on Ec2 server is final step') {
        steps {
            sh "export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home && java -jar $WORKSPACE/target/*.jar"
        }
    }*/
}

}
