pipeline {
    agent any

stages {
    
    stage('Check in Java') {
        steps {
            sh "export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home && java -version"
        }
    }

    stage('Install jHipster') {
        steps {
            sh "/usr/bin/npm install  generator-jhipster yo@latest"
            
        }
    }

    stage('Packaging the build now') {
        steps {
            sh "./mvnw -Pprod clean verify"
        }
    }

//   stage ('Sonar Analysis') {
//      steps {
//	      withSonarQubeEnv('sonarqube')
//		{
//		    sh "/opt/sonar_scanner/bin/sonar-scanner -Dsonar.host.url=${SONAR_HOST_URL} -Dsonar.login=admin -Dsonar.password=admin -Dsonar.projectName=$JOB_NAME -Dsonar.projectVersion=1.0 -Dsonar.projectDescription=$JOB_NAME -Dsonar.projectKey=$JOB_NAME  -Dsonar.sources=umsl/ -Dsonar.language=java -Dsonar.projectBaseDir=/var/lib/jenkins/workspace/umsl/" 
//        }    
//          }
 //     }

   stage('Execute java jar file') {
           steps {
	      sh "export jarjava=`ps -ef | grep java | grep -v grep |  grep 'java -jar' | awk '{print \$2}'` && if ! test -z \${jarjava};then kill -9 \${jarjava};fi"
              sh "export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home && java -jar /var/lib/jenkins/workspace/umsl/target/*.jar "
        }
    }
    stage('Send Email notification') {
	    steps {
	          mail bcc: '', body: "This is Jenkins Build Name ${env.JOB_NAME} and Build Number is [${env.BUILD_NUMBER}] which have result ${currentBuild.currentResult}", cc: '', from: '', replyTo: '', subject: 'Testing', to: 'vikchallenge@gmail.com'
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
