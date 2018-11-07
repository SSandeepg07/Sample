pipeline {
	agent any
	
	
	environment {
		DOCKER_REGISTRY_URL = "containers.cisco.com"
		DOCKER_REPOSITORY = "it_gats_it_architecture"
		SPARK_ROOM = "f8a4ba50-c8ae-11e8-83f0-e979ec425cee"
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
        		pushDocker(authId: "code_sda_app")
			}
		}
    }
	
	post{
		always {
			notifyBuildEnd()
		}
	}
}
