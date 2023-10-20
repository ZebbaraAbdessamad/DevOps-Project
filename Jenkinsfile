pipeline {
    tools {
          // Specify the name of the Maven installation defined in Jenkins
          maven 'Maven'
    }

    agent any
    
    environment {
      dockerimagename = "abdessamadzebbara/spring-boot-k8s"
      dockerImage = ""
    }
      
    stages {

        stage('Build App') {
            steps {
                // Build your Spring Boot application
                sh 'mvn clean package' // Adjust your build command
            }
        }
        
        stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build dockerImage
                }
            }
        }

        stage('Pushing Image') {
          environment {
                  registryCredential = 'dockerhub-credentials'
              }
          steps{
            script {
              docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
                dockerImage.push("latest")
              }
            }
          }
        }

        stage('Update kubeconfig') {
           steps {
              script {
                  withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_Credentials']]) {
                      // Update the kubeconfig to include your EKS cluster
                      sh 'aws eks update-kubeconfig --name my-eks-cluster' 
                  }
              }
           }
        }

        stage('Deploy to Amazon EKS') {
            steps {
                sh 'kubectl apply -f deployment-k8s.yaml'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}


