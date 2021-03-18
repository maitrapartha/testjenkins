pipeline {
    agent any

    tools {
       // that is the name of the "maven installation " in Global settings
        maven "m3"
        terraform 'terraform'
    }

    environment {
          VERSION = "${BUILD_NUMBER}"
          //PROJECT = "hello-service"
          PROJECT = 'partham'
          //IMAGE = "$PROJECT:$VERSION"
          IMAGE = "$PROJECT:latest"
          ECR_URL = "https://113136225681.dkr.ecr.us-east-1.amazonaws.com/partham"
          AWS_CRED = "ecr:us-east-1:AWSCreECR"
          AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY')
          AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_KEY')
    }


    stages {
        stage('git checkout') {
            steps {
               git credentialsId: 'git_cred_maitra_p',
               url: 'https://github.com/maitrapartha/testjenkins.git'
            }
        }
        stage('maven build') {
            steps {
                sh "mvn -version"
                sh "mvn clean install -DskipTests=true"
                sh "echo 'done with maven build'"
            }
        }
        /*stage('maven test') {
            steps {
               sh "mvn test"
            }
        }*/

        stage('terraform init') {
                    steps {
                       sh "terraform init"
                    }
                }
                stage('terraform apply') {
                    steps {

                       sh "terraform apply --auto-approve"
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


/* pipeline {
    agent any

    tools {
       // that is the name of the "maven installation " in Global settings
        maven "m3"
    }

    stages {
        stage('git checkout') {
            steps {
               git credentialsId: 'git_cred_maitra_p', url: 'https://github.com/maitrapartha/testjenkins.git'
            }
        }
        stage('maven build') {
            steps {
                sh "mvn -version"
                sh "mvn clean install -DskipTests=true"
                sh "echo 'done with maven build'"
            }
        }
        stage('maven test') {
            steps {
               sh "mvn test"
            }
        }
        stage('docker build') {
            steps {
               sh "docker version"
               sh "docker build -t maitrapartha/hello-world ."
            }
        }



    }

    post {
        always {
            cleanWs()
        }
    }
}
*/
