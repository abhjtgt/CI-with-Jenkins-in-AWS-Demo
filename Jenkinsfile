pipeline {
    agent any
    environment {
	    MVN_GROUPID = "com.tommy"
	    MVN_REPOSITORY = "maven-releases"
	    
	    
    }
    
    stages {
        stage('Build') {
            steps {
		echo "Building project"
                echo "Getting package from git." 
                git branch: 'local-try', url: 'https://github.com/abhjtgt/CI-with-Jenkins-in-AWS-Demo.git'
            
                echo "Maven - building package." 
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            post {
                // If Maven was able to run the tests, even if some of the test failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts '*/target/*.war'
                }
            }
        }

        stage("Publish") {
            steps {
		    script {
			Date date = new Date()
			String datePart = date.format("yyyy-MM-dd")
			String timePart = date.format("HH-mm-ss")
			env.version = datePart + "-" + timePart
		    }
		    	echo "Publishing artifact to nexus as version: " + env.version
			nexusArtifactUploader artifacts: [[artifactId: 'tommy', classifier: '', file: 'project/target/project-1.0-RAMA.war', type: 'war']], credentialsId: 'az-ubuntu-nexus1', groupId: env.MVN_GROUPID, nexusUrl: 'localhost:8081', nexusVersion: 'nexus3', protocol: 'http', repository: env.MVN_REPOSITORY, version: env.version
            }
        }

        stage("Deploy") {
            steps {
			echo "Deploying package to Web server. "
			deploy adapters: [tomcat7(credentialsId: 'az-ubuntu-tomcat7', path: '', url: 'http://10.128.0.4:8080/')], contextPath: '/Devops', war: '**/*war'
            }
        }
    }
}
