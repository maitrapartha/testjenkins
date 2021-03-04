pipeline {
    agent any

    tools {
       // that is the name of the "maven installation " in Global settings
        maven "M3"
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
                sh "mvn clean install"
                sh "echo 'done with maven build'"
            }
        }
        stage('maven test') {
            steps {
               sh "mvn test"
            }
        }
        stage('maven test') {
            steps {
               sh "docker -v"
               sh "docker build -t maitrapartha/hello-service ."
            }
        }


    }

    post {
        always {
            cleanWs()
        }
    }
}