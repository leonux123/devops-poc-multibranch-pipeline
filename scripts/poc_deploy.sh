#!/bin/bash

backupApp(){
	cd
	NOW=$(date +"%Y%m%d%H%M%S")
	mv poc/poc_admin-1.0.zip poc/archive/"poc_admin-${NOW}"
}

updateRepo(){
	cd devops-poc-scala
	git pull origin master
	sleep 15	
}

buildApp(){
	sbt dist
	sleep 45
}

setEnv(){
	cd
	mv devops-poc-scala/target/universal/poc_admin-1.0.zip ./poc/
	cd poc/
	rm -r pocadmin/
	rm play.pid
	unzip poc_admin-1.0.zip
	mv poc_admin-1.0 ./pocadmin
}

startApp(){
	echo "[poc-deploy] starting application"
	cd
	devops-poc-scala/scripts/admin-start.sh
}

run(){
	echo "[poc-deploy]"
	
	backupApp
	updateRepo
	buildApp
	setEnv
	startApp
}

run

exit 0;
