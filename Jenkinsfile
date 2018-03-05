pipeline {
    agent any

    stages {
		stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('AutoDeploy') {
            steps {
				cd C:\\Users\\Gullima\\Desktop\\proj
				prova1.bat
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}