pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out the Repository...'
                bat "dir"
                git branch: 'main', url: 'https://github.com/jonathanwshort/jenkins.git'
                bat "dir"
            }
        }

        stage('Login to Azure') {
            steps {
                echo 'Setting Azure Environment'
                bat 'az cloud set --name AzureUSGovernment'
                
            }
        }
    }

    post {
        always {
            echo 'I will always say hello'
        }
    }
}