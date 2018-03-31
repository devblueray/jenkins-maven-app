pipeline {
	agent {
		docker {
			image 'maven:3-alpine'
			args '-v /root/.m2:/root/.m2'
		}
	}

	stages {
		stage('Build') {
			steps {
				sh 'mvn -B -D skipTests clean package'
				app = docker.build("devblueray/java-maven-test")
			}
		}
		stage('Test') {
			steps {
				sh 'mvn test'
				app.inside { 
					sh 'echo "Tests passed"'
				}
			}
			post {
				always {
					junit 'target/surefire-reports/*.xml'
				}
			}
		}
		stage('Deliver') {
			steps {
				docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
					app.push("${env.BUILD_NUMBER}")
					app.push("latest")
				}
				sh './jenkins/scripts/deliver.sh'
			}
		}
	}
}

