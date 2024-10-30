pipeline {
    agent any
    environment {
        AZURE_CREDENTIALS = credentials('a1a5607e-246b-4f17-a088-cff1034d2dfa') // Replace with your credentials ID
    }
    stages {
        stage('Deploy Azure SQL Server') {
            steps {
                script {
                    withCredentials([azureServicePrincipal(
                        credentialsId: env.AZURE_CREDENTIALS,
                        subscriptionIdVariable: '284ea37b-bcc5-43f3-840c-ea3e3dca9169',
                        clientIdVariable: 'a1a5607e-246b-4f17-a088-cff1034d2dfa',
                        clientSecretVariable: 'ca0_G7k1mXa5JW_WmsH50~vV_3a76t.B_6',
                        tenantIdVariable: '03f141f3-496d-4319-bbea-a3e9286cab10'
                    )]) {
                        sh '''
                        az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID
                        az sql server create --name shortysqlserver --resource-group JenkinsTest --location usgovvirginia --admin-user adminshorty --admin-password admin-password
                        '''
                    }
                }
            }
        }
    }
}


pipeline {
    agent any
    stages {
        stage('Verify Azure CLI') {
            steps {
                sh 'az --version'
            }
        }
        // Other stages...
    }
}
