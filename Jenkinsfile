pipeline {
    agent any
    tools {
      maven "m3"
      terraform 'terraform'
    }
    environment {
        TERRAFORM_FILE_PATH = "terraforms"
          //PROJECT = "hello-service"
          PROJECT = 'partham'
          IMAGE = "$PROJECT:latest"
          ECR_URL = "https://113136225681.dkr.ecr.us-east-1.amazonaws.com/partham"
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
        stage('terraform destroy') {
            steps {
                dir("${TERRAFORM_FILE_PATH}") {
                        sh "terraform destroy --auto-approve"
                    }

            }
        }
        /*stage('terraform apply') {
            steps {
                dir("${TERRAFORM_FILE_PATH}") {
                        sh "terraform apply --auto-approve"
                    }

            }
        }*/
        stage('maven build') {
            steps {
                sh "mvn -version"
                sh "mvn clean install -DskipTests=true"
                sh "echo 'done with maven build'"
            }
        }
        stage('docker build') {
            steps {
               sh "docker version"
               script {
                   docker.build('$IMAGE')
               }
               //sh "docker build -t maitrapartha/hello-world ."
            }
        }
        stage('ECR push') {
            steps {
                script{
                    docker.withRegistry(ECR_URL , AWS_CRED) {
                        docker.image(IMAGE).push()
                    }
                }
               /* withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    credentialsId: 'AWSCreECR',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh
                }*/
            }
        }
    }

    post {
        always {
            sh "docker image rmi $IMAGE"
            cleanWs()
        }
    }
}





/*pipeline {
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
*/
