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
        stage('Deliver for development') {
            when {
                branch 'development' 
            }
            steps {
                sh 'echo "Publish Over SSH..."'
	                     sh 'scp -v -i /home/leonux/aws/MyKeyPair.pem -o StrictHostKeyChecking=no target/universal/poc_admin-1.0.zip ec2-user@54.185.245.26:poc/'
	                     sh 'ssh -i /home/leonux/aws/MyKeyPair.pem ec2-user@54.185.245.26 ./deliver.sh'                
	                     input message: 'Finished using the web site? (Click "Proceed" to continue)'
	                     sh 'ssh -i /home/leonux/aws/MyKeyPair.pem ec2-user@54.185.245.26 ./kill.sh'
            }
        }
        stage('Deploy for release') {
            when {
                branch 'release'  
            }
            steps {
                sh 'echo "Publish Over SSH..."'
	                     sh 'scp -v -i /home/leonux/aws/MyKeyPair.pem -o StrictHostKeyChecking=no target/universal/poc_admin-1.0.zip ec2-user@52.36.62.178:poc/'
	                     sh 'ssh -i /home/leonux/aws/MyKeyPair.pem ec2-user@52.36.62.178 ./deliver.sh'                
	                     input message: 'Finished using the web site? (Click "Proceed" to continue)'
	                     sh 'ssh -i /home/leonux/aws/MyKeyPair.pem ec2-user@52.36.62.178 ./kill.sh'
            }
        }
    }
}
