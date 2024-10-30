pipeline {
    agent { docker { image 'maven:3.9.9-eclipse-temurin-21-alpine' } } [^1^][1]
    stages {
        stage('build') { {[^2^][2]
            steps {
                sh 'mvn clean install'
            }
        }
    }
}
