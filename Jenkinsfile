pipeline {
    agent any
    tools {
      terraform 'terraform'
    }
    environment {
        TERRAFORM_FILE_PATH = "terraforms"
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
                sh "${env.TERRAFORM_FILE_PATH}/terraform init"
            }
        }
    }
}
