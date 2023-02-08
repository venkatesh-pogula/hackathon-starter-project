pipeline{
    agent {label 'Trivy'}
    enviroment{
        IMAGE_NAME = 'nodejs'
    }
    stages{
        stage ('SCM'){
            steps{
               checkout([$class: 'GitSCM', branches: [[name: '*/trivy']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/venkatesh-pogula/hackathon-starter-project.git']]])
            }
        }
        stage('build image'){
            steps{
                sh 'Docker image build -t ${IMAGE_NAME} .'
            }
        }
        stage('To scan image'){
            steps{
                sh 'trivy image ${IMAGE_NAME}'
            }
        }
    }
}