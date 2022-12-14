pipeline {
    agent any
    environment {
        AWS_ACCOUNT_ID="220080856178"
        AWS_DEFAULT_REGION="us-east-1" 
        REPOSITORY_URI = "220080856178.dkr.ecr.us-east-1.amazonaws.com/ecr-sahil"
        ECR_REGISTRY = '220080856178.dkr.ecr.us-east-1.amazonaws.com/ecr-sahil'
        PATH = "/usr/local/bin/:${env.PATH}"
    }
    
    stages {
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/sahil-sheikh-17/ECSTerra.git']]])     
            }
        }
    

        stage('Build Docker Image') {
            steps {
                sh 'docker build --force-rm -t "220080856178.dkr.ecr.us-east-1.amazonaws.com/ecr-sahil:latest" .'
                sh 'docker image ls'
            }
        }
        stage('Push Image to ECR Repo') {
            steps {
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin --password-stdin 220080856178.dkr.ecr.us-east-1.amazonaws.com'
                sh 'docker push 220080856178.dkr.ecr.us-east-1.amazonaws.com/ecr-sahil:latest'
            }
        }
        
        stage('Deploy on Docker Machine') {
            steps {
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 220080856178.dkr.ecr.us-east-1.amazonaws.com'
                sh 'docker pull 220080856178.dkr.ecr.us-east-1.amazonaws.com/ecr-sahil:latest'
                sh 'docker rm -f mypythonContainer | echo "there is no docker container named todo"'
                sh 'docker run --name mypythonContainer -dp 8096:5000 220080856178.dkr.ecr.us-east-1.amazonaws.com/ecr-sahil:latest'
            }
        }
        
    }
}
