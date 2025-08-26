pipeline{
  agent any

  environment{
    DOCKER_HUB_CREDENTIALS=credentials('dockerhub-credss')
    DOCKER_IMAGE='edy2010/node-app'
  }

  stages{
    stage('Checkout'){
      steps{
        checkout scm
      }
    }
    stage('Build'){
      steps{
        script{
          dockerimage=docker.build("${env.DOCKER_IMAGE}:${BUILD_NUMBER}")
        }
      }
    }
    stage('Push to Docker Hab'){
      steps{
        script{
          docker.withRegistry('https://registry.hub.docker.com','dockerhub-creds')
        }
      }
    }
    stage('Deploy'){
      steps{
        sh '''
        docker stop node-app || true
        docker rm node-app || true
        docker run -d --name node-app -p 3000:3000 ${DOCKER_IMAGE}:${env.IMAGE_TAG}
        '''
      }
    }
  }
}
