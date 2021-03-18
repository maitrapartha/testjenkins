pipeline {
    agent any
    tools {
      terraform 'terraform'
    }
    environment {
        TERRAFORM_FILE_PATH = "terraforms"
        AWS_CRED = "ecr:us-east-1:AWSCreECR"
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_KEY')
    }

    stages {
        stage('gitcheckout') {
            steps {
                git branch: 'try2ECS',
                url: 'https://github.com/maitrapartha/testjenkins'
            }
        }
        stage('terraform init') {
            steps {
                dir("${TERRAFORM_FILE_PATH}") {
                        sh "terraform init"
                    }

            }
        }
        stage('terraform plan') {
            steps {
                dir("${TERRAFORM_FILE_PATH}") {
                        sh "terraform plan"
                    }

            }
        }
    }
}