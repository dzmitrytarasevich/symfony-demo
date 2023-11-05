pipeline {
  agent {
    label 'vm'
  }
  stages {
    stage('build docker image') {
      steps {
        sh """
          docker build -t local/symfony .
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
