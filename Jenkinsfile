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
	                     sh 'scp -v -i /home/leonux/aws/MyKeyPair.pem -o StrictHostKeyChecking=no target/universal/poc_admin-1.0.zip ec2-user@18.237.70.190:poc/'
	                     sh 'ssh -i /home/leonux/aws/MyKeyPair.pem ec2-user@18.237.70.190 ./deliver.sh'                
	                     input message: 'Finished using the web site? (Click "Proceed" to continue)'
	                     sh 'ssh -i /home/leonux/aws/MyKeyPair.pem ec2-user@18.237.70.190 ./kill.sh'
            }
        }
        stage('Deliver for release') {
            when {
                branch 'release'  
            }
            steps {
                sh 'echo "Publish Over SSH..."'
	                     sh 'scp -v -i /home/leonux/aws/MyKeyPair.pem -o StrictHostKeyChecking=no target/universal/poc_admin-1.0.zip ec2-user@52.43.3.218:poc/'
	                     sh 'ssh -i /home/leonux/aws/MyKeyPair.pem ec2-user@52.43.3.218 ./deliver.sh'                
	                     input message: 'Finished using the web site? (Click "Proceed" to continue)'
	                     sh 'ssh -i /home/leonux/aws/MyKeyPair.pem ec2-user@52.43.3.218 ./kill.sh'
            }
        }
	stage('Deploy to PROD') {
            when {
                branch 'master' 
            }
            steps {
                sh 'echo "Publish Over SSH..."'
	                     sh 'scp -v -i /home/leonux/aws/MyKeyPair.pem -o StrictHostKeyChecking=no target/universal/poc_admin-1.0.zip ec2-user@34.222.142.196:poc/'
	                     sh 'ssh -i /home/leonux/aws/MyKeyPair.pem ec2-user@34.222.142.196 ./deliver.sh'                
	                     input message: 'Finished using the web site? (Click "Proceed" to continue)'
	                     sh 'ssh -i /home/leonux/aws/MyKeyPair.pem ec2-user@34.222.142.196 ./kill.sh'
            }
        }
    }
}
