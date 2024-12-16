pipeline {
    agent any
    stages {
        stage('SCM') {
            steps {
                git credentialsId: 'Github', url: 'https://github.com/CHERUKURIPRAVEEN/project-test-terraform.git'
            }
        }
        stage('AWS_CONFIG') {
            steps {
                withAWS(credentials: 'AWS_DEV', region: 'us-east-1')
                sh 'aws --version'
            }
        }
    }
}
