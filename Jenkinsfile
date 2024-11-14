pipeline{
    agent any
    
    stages {
        stage("checkout"){
            steps{
                bat "dir"
                git branch:'main', url:"https://github.com/jonathanwshort/jenkins.git"
                bat "dir"
            }
        }
    }
}