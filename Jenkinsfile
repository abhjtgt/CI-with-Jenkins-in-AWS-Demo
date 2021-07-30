pipeline {
    agent any

    
    stages {
        stage('Build') {
            steps {
                echo "Building project"
                // Get some code from a GitHub repository
                echo "Getting package from git" 
                git 'https://github.com/abhjtgt/CI-with-Jenkins-in-AWS-Demo.git'

                // Run Maven on a Unix agent.
                //sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                echo "Maven - building package" 
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
        stage("Nexus backup") {
            steps {
             echo "Uploading war file to Nexus" 
            nexusArtifactUploader {
            nexusVersion('nexus3')
            protocol('http')
            nexusUrl('localhost:8081')
            groupId('com.tommy')
            version('1.0.3')
            repository('maven-releases')
            credentialsId('6fc5e49f-44e3-4af4-b231-7691368fd20e')
            artifact {
                artifactId('tommy')
                type('war')
                classifier('')
                file('project/target/project-1.0-RAMA.war')
            }
          }
            }
        }
    }
}
