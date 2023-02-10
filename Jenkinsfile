pipeline{
    agnet { label 'sonar'}
    enviroment{
        NPM = 'npm install'
    }

    stages{
        stage('checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/sonar']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/venkatesh-pogula/hackathon-starter-project.git']]])
            }
        }
        stage('build'){
            steps{
                sh 'npm install'
            }
        }
        stage('sonar_check'){
            steps{
               sh 'npm install --save-dev sonarqube-scanner'
            }
        }
    }
}