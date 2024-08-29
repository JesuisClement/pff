node {
  def app
  stage('Clone repository') {
    checkout scm  
  }
  stage('Build image') {
    app = docker.build("clemzer/pff") 
  }
  stage('Push image') {
    docker.withRegistry('https://registry.hub.docker.com', 'docker-credentials') {
      app.push("latest")
    }  
  }
  stage('Deploy to Docker Swarm') {
    sh '''
      docker -H tcp://10.70.50.174:2375 service update --image clemzer/pff:latest my_service
    '''
  }
}
