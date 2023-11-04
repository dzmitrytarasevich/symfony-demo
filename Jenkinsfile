pipeline {
  agent any
  stages {
    stage('Stop and remove containers') {
      steps {
        sh """
          docker compose -f docker-compose.yml stop
          docker compose -f docker-compose.yml kill
          docker compose -f docker-compose.yml rm -f -s -v
        """
      }
    }
    stage('Run docker compose') {
      steps {
        sh """
          docker compose -f docker-compose.yml up -d --build --force-recreate -V --wait --timestamps
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
