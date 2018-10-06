pipeline {
	agent any
	tools {
		maven 'Maven-3.3.1'
		jdk 'JDK1.8.0'
	}
	
	environment {
		DOCKER_REGISTRY_URL = "containers.cisco.com"
		DOCKER_REPOSITORY = "it_gats_it_architecture"
		SPARK_ROOM = "3475cbde-fbfb-3777-b3f4-19767b168e3e"
	}

    stages {
        stage ('Build') {
        	steps {      
				notifyBuildStart()			
				sh 'mvn clean install'
            }
        }
		stage ('Test') {
			steps {
				sh 'mvn org.jacoco:jacoco-maven-plugin:prepare-agent test'
				sonarScan('Sonar')
			}
			post {
				success {
					junit testResults: 'target/surefire-reports/**/*.xml', allowEmptyResults: true
				}
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
		stage ('Docker Build') {
			steps{
				sh 'docker build . --build-arg JAR=app-0.0.1.jar -t sda-app'
				tagDocker(oldTag: 'sda-app', image: 'code-sda-demo_code-sda-app')
				notifyDocker();
			}
		}
		stage ('Docker Deploy') {
        	steps {
        		pushDocker(authId: "it_gats_it_architecture")
			}
		}
    }
	
	post{
		always {
			notifyBuildEnd()
		}
	}
}