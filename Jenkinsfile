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
        stage('Deploy to Docker Swarm') {
            steps {
                script {
                    sh '''
                        docker -H tcp://10.70.50.160:2375 service update --image clemzer/pff:latest my_service
                    '''
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
