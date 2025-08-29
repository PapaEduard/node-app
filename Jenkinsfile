pipeline{
  agent any

  environment{
    REPO = 'edy2010/node-app'
    DOCKER_TOKEN = credentials('dockerhub-creds')
    PRJ_NAME = 'node-app'
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
          sh"""
            docker build -t "${REPO}:${PRJ_NAME}-${BUILD_NUMBER}" .
          """
        }
      }
    }
    stage('Push to Docker Hab'){
      steps{
        script{
          sh"""
            docker login -u Edy2010 -p ${DOCKER_TOKEN}
            docker push "${REPO}:${PRJ_NAME}-${BUILD_NUMBER}"
          """
          }
        }
      }
    }
    
  }

