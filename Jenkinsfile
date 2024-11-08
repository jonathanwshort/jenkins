pipeline {
    agent any
    environment {
        AZURE_CLIENT_ID = credentials('azure-client-id')
        AZURE_CLIENT_SECRET = credentials('azure-client-secret')
        AZURE_TENANT_ID = credentials('azure-tenant-id')
        AZURE_SUBSCRIPTION_ID = credentials('azure-subscription-id')
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/jonathanwshort/jenkins.git'
            }
        }
        stage('Login to Azure') {
            steps {
                withCredentials([azureServicePrincipal(credentialsId: "${AZURE_CREDENTIALS_ID}")]) {
                    sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID'
                    sh 'az account set --subscription $AZURE_SUBSCRIPTION_ID'
                }
            }
        }
        stage('Deploy Bicep') {
            steps {
                sh 'az deployment group create --resource-group jenkinsRG --template-file main.bicep'
            }
        }
    }
}