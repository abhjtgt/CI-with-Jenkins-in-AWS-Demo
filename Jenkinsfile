pipeline {
    agent any
    environment {
	    MVN_GROUPID = "com.tommy"
	    MVN_REPOSITORY = "maven-releases"
	    SNR_TKN = "4cc74f5cc72617102abfc0e28e9405c3e1879394"
	    EMAIL_DL = "abhijitdd@yahoo.co.in"
    }
    
    stages {
        
/*	    stage('Quality check') {
		    steps {
			    echo "Checking code quality with sonarQube." 
			    sh "mvn sonar:sonar -Dsonar.projectKey=CI-with-Jenkins -Dsonar.host.url=http://127.0.0.1:9000 -Dsonar.login=$SNR_TKN"
		    }
	    }
*/	
	    stage('Build code') {
		    steps {
			echo "Building project"
			git branch: 'assignment3', url: 'https://github.com/abhjtgt/CI-with-Jenkins-in-AWS-Demo.git'

			echo "Maven - building package." 
			sh "mvn -Dmaven.test.failure.ignore=true clean package"
		    }
	    }
	
	    stage("Build image") {
		    steps {
			    echo "Building image with new built artifact"
			    sh "ls -lrt"
			    sh "cp project/target/*war . 
			    sh "ls -lrt"

		    }
		}

	    stage("Run image") {
		    steps {
				echo "Running docker image"
				sh "docker image "
		    }
		}
    }
}
