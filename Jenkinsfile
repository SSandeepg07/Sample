pipeline {
	agent any
	tools {
		maven 'Maven-3.3.1'
		jdk 'JDK1.8.0'
	}

    stages {
        stage ('Source Build') {
        	steps {                
				sh 'mvn clean install'
            }
        }
		/*
		stage ('Test') {			
			parallel {
				stage ('Sonar') {
					steps {
						sh 'echo "skip...."'
					}
				}
				stage ('Selenium') {
					steps {
						sh 'echo "skiping selenium...."'
					}
				}
			}
		}
		*/
		stage ('Docker Build & Publish') {
			steps{
				sh 'docker build . --build-arg JAR=app-0.0.1.jar -t containers.cisco.com/jenkins_ci_gen/code-sda-app:${BUILD_NUMBER}'
				sh 'docker push containers.cisco.com/jenkins_ci_gen/code-sda-app:${BUILD_NUMBER}'
				sh 'docker tag	containers.cisco.com/jenkins_ci_gen/code-sda-app:${BUILD_NUMBER} containers.cisco.com/jenkins_ci_gen/code-sda-app:latest'
				sh 'docker push containers.cisco.com/jenkins_ci_gen/code-sda-app:latest'
			}
		}
    }
	
	//post{
	//	
	//}
}