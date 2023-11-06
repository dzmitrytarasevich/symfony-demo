pipeline {
  agent {
    label 'vm'
  }
  stages {
    stage('build docker image') {
      steps {
        sh """
         docker build -t localhost:32000/symfony:latest .
        """
      }
    }
    stage('push docker image') {
      steps {
        sh """
          docker push localhost:32000/symfony:latest
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
    success {
      build job: "chart", wait: true
    }
  }
}
