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
				bat 'cd C:\\Users\\Gullima\\Desktop\\proj'
				bat 'prova1.bat'
            }
        }
        stage('Test') {
            steps {
                bat 'cd C:\\Users\\Gullima\\Desktop'
				echo 'ciao ciao' 
				echo 'compilazione fatta' 
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}