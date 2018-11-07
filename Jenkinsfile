pipeline {
	agent any
	
	

    stages {
        stage ('One') {
        	steps {      
			echo 'first stage'
            }
        }
		stage ('Two') {
			agent {
				Docker{
					reuseNode false
				image 'ubuntu'
				}
			steps {
				echo '2nd stage'
			}
			}
			
		}
		
	}
	    

}
