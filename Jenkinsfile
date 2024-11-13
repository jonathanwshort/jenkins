pipeline {
    agent any

    environment {
        MY_CRED = credentials('jenkins_sp')
    }

    stages {
        stage('Login to Azure') {
            steps {
                bat '''
                    @echo off
                    az cloud set --name AzureUSGovernment
                    az login --service-principal -u %MY_CRED_CLIENT_ID% -p $MY_CRED_CLIENT_SECRET --tenant $MY_CRED_TENANT_ID"
                    az account set --subscription %AZURE_SUBSCRIPTION_ID%
                    IF %ERRORLEVEL% NEQ 0 (
                        exit /b 1
                    )
                '''
            }
        }


    }

    post {
        always {
            bat 'az logout'
        }
    }
}