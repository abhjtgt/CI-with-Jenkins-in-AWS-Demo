pipeline {
    agent any
    environment {
	    MVN_GROUPID = "com.tommy"
	    MVN_REPOSITORY = "maven-releases"
	    SNR_TKN = "4cc74f5cc72617102abfc0e28e9405c3e1879394"
	    EMAIL_DL = "abhijitdd@yahoo.co.in"
    }
    
    stages {
        
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
			    sh '''
			    echo "Checking for artifact" 
			    cd project/target
			    artifact=$(ls -1t *war| head -1)
			    
			    if [ -z $artifact ] ;
			    then
			    	echo "Artifact not found" 
			    else
				echo "Artifact found $artifact. Building new image."    
			    	cd ../..
				cp project/target/${artifact} .
			    fi
			    exit 123
			    '''
			    

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
