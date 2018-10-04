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
                sh 'scp -v -i /home/leonux/aws/MyKeyPair.pem -o StrictHostKeyChecking=no target/universal/poc_admin-1.0.zip ec2-user@52.36.62.178:poc/'
                sh 'ssh -i /home/leonux/aws/MyKeyPair.pem -o ConnectTimeout=120 ec2-user@52.36.62.178 ./deliver.sh'
            }
        }
    }
}
