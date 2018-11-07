pipeline {
	agent any
	
	

    stages {
        stage ('One') {
        	steps {      
			echo 'first stage'
            }
        }
		stage ('Two') {
			agent Docker{
				image 'ubuntu'
			steps {
				echo '2nd stage'
			}
			}
			post {
				success {
					echo 'success of 2nd stage'
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
		} */
	}
	    
}
