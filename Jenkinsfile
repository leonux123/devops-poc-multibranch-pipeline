pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                sh 'sbt test'
                junit 'target/test-reports/*.xml'
            }
        }
        stage('Build') {
            steps {
                sh 'sbt dist'
            }
        }
        stage('Deliver') { 
            steps {
                input message: 'Finished using the web site? (Click "Proceed" to continue)' 
            }
        }
    }
}
