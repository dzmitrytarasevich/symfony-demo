pipeline {
  agent {
    label 'vm'
  }
  stages {
    stage('build docker image') {
      steps {
        sh """
          sudo docker build -t symfony .
        """
      }
    }
    stage('Run docker compose') {
      steps {
        sh """
          sudo docker run -d -p 8000:8000 symfony
        """
      }
    }
  }
  post {
    failure {
      sh "sudo docker image prune -f"
    }
    always {
      cleanWs()
    }
  }
}
