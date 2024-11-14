pipeline {
    agent any

    environment {
        MY_CRED_AZURE_CLIENT_ID = 'f4732144-023b-4471-b433-fe6db5a0e6dd'
        MY_CRED_AZURE_CLIENT_SECRET = '0DY9eMdSL_..m8bW-~dNFYQzplpCdWW5P1'
        MY_CRED_AZURE_TENANT_ID = '03f141f3-496d-4319-bbea-a3e9286cab10'
        MY_CRED_AZURE_SUBSCRIPTION_ID = '284ea37b-bcc5-43f3-840c-ea3e3dca9169'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out the Repository...'
                bat "dir"
                git branch: 'main', url: 'https://github.com/jonathanwshort/jenkins.git'
                bat "dir"
            }
        }

        stage('Set Azure Environment') {
            steps {
                echo 'Setting Azure Environment'
                bat 'az cloud set --name AzureUSGovernment'
            }
        }

        stage('Login with Service Principal Credentials') {
            steps {
                echo "Logging into AzureUSGovernment"
                bat '''
                    az login --service-principal -u %MY_CRED_AZURE_CLIENT_ID% -p %MY_CRED_AZURE_CLIENT_SECRET% --tenant %MY_CRED_AZURE_TENANT_ID%
                    az account set --subscription %MY_CRED_AZURE_SUBSCRIPTION_ID%
                    az account show
                    IF %ERRORLEVEL% NEQ 0 (
                        exit /b 1
                    )
                '''
            }
        }

        stage('Verify Login') {
            steps {
                echo 'Verifying Azure Login...'
                bat '''
                    az account show
                    IF %ERRORLEVEL% NEQ 0 (
                        echo Azure login verification failed.
                        exit /b 1
                    ) ELSE (
                        echo Azure login verification succeeded.
                    )
                '''
            }
        }

        stage('Deploy RG Bicep') {
            steps {
                echo 'Deploying Resource Group using Bicep...'
                bat '''
                    az deployment group create --resource-group JenkinsTest --template-file main.bicep
                    IF %ERRORLEVEL% NEQ 0 (
                        exit /b 1
                    )
                '''
            }
        }
    }

    post {
        always {
            echo 'Logging out of Azure...'
            bat 'az logout'
        }
    }
}