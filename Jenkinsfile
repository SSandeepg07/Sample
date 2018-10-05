pipeline {
	agent any
	tools {
		maven 'Maven-3.3.1'
		jdk 'JDK1.8.0'
	}
	
	environment {
		DOCKER_REPO = "containers.cisco.com/it_gats_it_architecture/code-sda-demo_code-sda-app"
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
				sh 'docker build . --build-arg JAR=app-0.0.1.jar -t ${DOCKER_REPO}:${BUILD_NUMBER}'
				sh 'docker push ${DOCKER_REPO}:${BUILD_NUMBER}'
				sh 'docker tag	${DOCKER_REPO}:${BUILD_NUMBER} ${DOCKER_REPO}:latest'
				sh 'docker push ${DOCKER_REPO}:latest'
			}
		}
    }
	
	//post{
	//	
	//}
}