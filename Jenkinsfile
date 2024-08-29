pipeline {
    agent any
    stages {
        stage('Clone repository') {
            steps {
                git branch: 'main', url: 'https://github.com/JesuisClement/pff.git'
            }
        }
        stage('Build image') {
            steps {
                script {
                    sh 'docker build -t clemzer/pff .'
                }
            }
        }
        stage('Push image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-credentials') {
                        docker.image('clemzer/pff').push('latest')
                    }
                }
            }
        }

    }
    post {
        failure {
            echo 'Pipeline failed!'
        }
        success {
            echo 'Pipeline succeeded!'
        }
    }
}
