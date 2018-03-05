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
                bat 'dir'
				cd C:\Users\Gullima\Desktop\proj
				bat 'prova1.bat'
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