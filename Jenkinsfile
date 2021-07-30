pipeline {
    agent any

    
    stages {
        stage('Build') {
            steps {
				echo "Building project"
                echo "Getting package from git." 
                git branch: 'local-try', url: 'https://github.com/abhjtgt/CI-with-Jenkins-in-AWS-Demo.git'
            
                echo "Maven - building package." 
                bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts '*/target/*.war'
                }
            }
        }

        stage("Publish") {
            steps {
				echo "Publishing artifact to nexus. "
				nexusArtifactUploader artifacts: [[artifactId: 'tommy', classifier: '', file: 'project/target/project-1.0-RAMA.war', type: 'war']], credentialsId: '6fc5e49f-44e3-4af4-b231-7691368fd20e', groupId: 'com.tommy', nexusUrl: 'localhost:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-releases', version: '1.0.3'
            }
        }

        stage("Deploy") {
            steps {
				echo "Deploying package to Web server. "
				deploy adapters: [tomcat7(credentialsId: 'b6c92161-b345-4e1d-96ff-0546ae50e092', path: '', url: 'http://localhost:8082/')], contextPath: '/tommy', war: '**/*war'
            }
        }
    }
}
