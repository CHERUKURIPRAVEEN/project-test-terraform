pipeline {
    agent any
    environment {
        TF_VERSION = '1.6.0' // Specify the Terraform version
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
                // sh '''
                // // # Download Terraform
                // // wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
                // // unzip terraform_${TF_VERSION}_linux_amd64.zip
                // // sudo mv terraform 
                // /usr/local/bin/terraform --version
                // '''
                sh '/usr/local/bin/terraform --version'
            }
        }
        stage('TERRAFORM_INIT') {
            steps {
                sh '''
                cd EC2/
                /usr/local/bin/terraform init
                '''
            }
        }
        stage('TERRAFORM_FMT') {
            steps {
                sh '''
                cd EC2/
                /usr/local/bin/terraform fmt
                '''
            }
        }
        stage('TERRAFORM_VALIDATE') {
            steps {
                sh '''
                cd EC2/
                /usr/local/bin/terraform validate
                '''
            }
        }
        stage('TERRAFORM_PLAN') {
            steps {
                sh '''
                cd EC2/
                /usr/local/bin/terraform plan
                '''
            }
        }
        stage('TERRAFORM_APPLY') {
            steps {
                sh '''
                cd EC2/
                /usr/local/bin/terraform apply -auto-approve
                '''
            }
        }
    }
}
