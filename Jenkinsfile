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
                sh 'echo "Publish Over SSH..."'
                scp -i /home/leonux/.ssh/MyKeyPair.pem target/universal/poc_admin-1.0.zip ec2-user@52.36.62.178:poc/
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
            }
        }
    }
}
