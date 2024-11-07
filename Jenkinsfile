pipeline {
    agent any

    environment {
        AZURE_CLIENT_ID = credentials('f4732144-023b-4471-b433-fe6db5a0e6dd')
        AZURE_CLIENT_SECRET = credentials('0DY9eMdSL_..m8bW-~dNFYQzplpCdWW5P1')
        AZURE_TENANT_ID = credentials('03f141f3-496d-4319-bbea-a3e9286cab10')
        AZURE_SUBSCRIPTION_ID = credentials('284ea37b-bcc5-43f3-840c-ea3e3dca9169')
    }

    stages {
        stage('Login to Azure') {
            steps {
                script {
                    sh '''
                        az cloud set --name AzureUSGovernment
                        az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID
                    '''
                }
            }
        }

        stage('Create Resource Group') {
            steps {
                script {
                    sh '''
                        az group create --name jPipeline1 --location usgovvirginia
                    '''
                }
            }
        }
    }
}