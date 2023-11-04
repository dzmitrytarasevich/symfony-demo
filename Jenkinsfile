pipeline {
  agent any
  stages {
    stage('build docker image') {
      steps {
        sh """
          docker build -t symfony .
        """
      }
    }
    stage('Run docker compose') {
      steps {
        sh """
          docker run -d -p 8000:8000 symfony
        """
      }
    }
  }
  post {
    failure {
      sh "docker image prune -f"
    }
    always {
      cleanWs()
    }
  }
}
