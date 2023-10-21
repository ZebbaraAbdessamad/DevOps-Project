pipeline {
    tools {
          // Specify the name of the Maven installation defined in Jenkins
          maven 'Maven'
    }

    agent any
    
    environment {
      AWS_DEFAULT_REGION = 'us-east-1'
      dockerimagename = "abdessamadzebbara/spring-boot-k8s"
      dockerImage = ""
    }
      
    stages {

        stage('Set Up Infrastructure with Terraform') {
            steps {
                script {
                    // Change to the Terraform directory
                    dir('terraform') {
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_Credentials']]) {
                            sh '''
                                export TF_VAR_aws_access_key=$AWS_ACCESS_KEY_ID
                                export TF_VAR_aws_secret_key=$AWS_SECRET_ACCESS_KEY
                                terraform init
                                terraform apply --auto-approve
                            '''
                        }
                    }
                }
            }
        }


        stage('Build App') {
            steps {
                // Build your Spring Boot application
                sh 'mvn clean package' // Adjust your build command
            }
        }
        
        stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build dockerimagename
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

        stage('Deploy to Amazon EKS') {
           steps {
              script {
                  withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_Credentials']]) {
                      // Update the kubeconfig to include your EKS cluster
                    sh '''
                       export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                       export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                       aws eks update-kubeconfig --name my-eks-cluster
                       kubectl apply -f deployment-k8s.yaml
                    '''
                  }
              }
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


