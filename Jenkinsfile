pipeline{
    agent {label 'Terraform'}
    parameters{
        choice(
            name: 'Terraform' choices: [ 'plan' , 'apply'] description: 'To run the terraform apply this'
        )
    }
    stages{
        stage('checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/terraform']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/venkatesh-pogula/hackathon-starter-project.git']]])
            }
        }
        stage('terraform init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform validate'){
            steps{
                sh 'terraform validate'
            }
        }
        stage('terraform plan'){
            steps{
                sh 'terraform ${params.terraform}'
            }
        }
        stage('terraform apply'){
            steps{
                sh 'terraform ${params.terraform}'
            }
        }
        stage('To deploy the mango db'){
            steps{
                sh 'ansible-playbook -i hosts mangodb.yml'
            }
        }

    }
}