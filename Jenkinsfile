pipeline {
    agent any

stages {
    
    stage('Check Java') {
        steps {
            sh "export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home && java -version"
        }
    }

    stage('Install jhipster') {
        steps {
            sh "/usr/bin/npm install  generator-jhipster yo@latest"
            
        }
    }

    stage('Packaging the build now') {
        steps {
            sh "./mvnw -Pprod clean verify"
        }
    }
	post {
        success {
            mail to:"vikchallenge@gmail.com", subject:"SUCCESS: ${currentBuild.fullDisplayName}", body: "Yay, we passed."
        }
        failure {
            mail to:"vikchallenge@gmail.com", subject:"FAILURE: ${currentBuild.fullDisplayName}", body: "Boo, we failed."
        }
    }   
}
}
	
//	stage('Sending Sending ') {
//		steps {
//		     mail(subject: 'Build', body: 'Your new Build '${env.JOB_NAME} [${env.BUILD_NUMBER}]' has been triggred for JHipster Prod Project', to: 'vikchallenge@gmail.com')
//		}
//	}

//}
//    stage('Test URL of webpage') {
//        steps {
//            sh "export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home && java -jar $WORKSPACE/target/*.jar"
//        }
//    }
//}

//}

//    stage('Upload to S3') {
//        steps {
//            withAWS(region:'region=ap-south-1',credentials:'teacher') {
//            s3Upload(bucket: 'case000', workingDir:'$WORKSPACE/target/', includePathPattern:'**/*');
//	    }
//		mail(subject: 'Build', body: 'New Deployment to Prod', to: 'vdkthakur@gmail.com')
//	}
//    }

    /*        pwd(); //Log current directory

            withAWS(region:'ap-south-1',credentials:'iamuser-student') {

                 def identity=awsIdentity();//Log AWS credentials

                // Upload files from working directory 'dist' in your project workspace
                s3Upload(bucket:"case000", workingDir:'dist', includePathPattern:'');
            }

        }
    }*/
	
   /*stage('Downlaod and Deploy on Ec2 server is final step') {
        steps {
            sh "export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home && java -jar $WORKSPACE/target/*.jar"
        };
    }*/
//}
