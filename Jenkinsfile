pipeline {
    agent any
    environment {
        // TF_VERSION = '1.6.0' // Specify the Terraform version
    }
    stages {
        stage('SCM') {
            steps {
                git credentialsId: 'Github', url: 'https://github.com/CHERUKURIPRAVEEN/project-test-terraform.git'
            }
        }
        stage('AWS_CONFIG') {
            steps {
                withAWS(credentials: 'AWS_DEV', region: 'us-east-1') {
                sh '/usr/local/bin/aws sts get-caller-identity --query Account --output text'
                }
            }
        }
        stage('TERRAFORM_CONFIG') {
            steps {
                sh '''
                // # Download Terraform
                // wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
                // unzip terraform_${TF_VERSION}_linux_amd64.zip
                // sudo mv terraform 
                /usr/local/bin/terraform --version
                '''
            }
        }
    }
}
