pipeline {
    agent any
    
    environment {
        
        IMAGE_NAME= 'dumalbhaskar/react-app'
    }

    stages {
        
        stage('git checkout') {
            steps {
                git changelog: false, poll: false, url: 'https://github.com/DumalBhaskar/simple-node-js-react-npm-app.git'
            }
        }
        
        stage('image build') {
            steps {
               sh 'docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} .'
            }
        }
        
         stage('image push') {
            steps {
               script {
                   withDockerRegistry(credentialsId: 'docker-cred', url: 'https://index.docker.io/v1/') {
                       
                       sh 'docker push ${IMAGE_NAME}:${BUILD_NUMBER}'
                    }
               }
            }
        }
    }
    
    post {
        
        success {
            
            mail bcc: '', body: "${JOB_NAME}, build success", cc: '', from: '', replyTo: '', subject: "Pipeline ${JOB_NAME} status", to: 'dumalbhaskar@gmail.com'
        }

        failure {
            
            mail bcc: '', body: "${JOB_NAME}, build failure", cc: '', from: '', replyTo: '', subject: "Pipeline ${JOB_NAME} status", to: 'dumalbhaskar@gmail.com'
        }
        
    }
}
