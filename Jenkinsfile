pipeline {
  agent {
    label 'vm'
  }
  stages {
    stage('build docker image') {
      steps {
        sh """
          docker build -t symfony:latest .
        """
      }
    }
    stage('push docker image') {
      steps {
        sh """
          docker save symfony:latest > symfony.tar
          microk8s ctr image import symfony.tar
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
