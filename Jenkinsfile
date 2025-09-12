pipeline {
    agent any

    environment {
        // Docker image name (will be local only)
        DOCKER_IMAGE = "springboot-example1"
        // Git repo
        GIT_REPO = "https://github.com/anuj2841/springboot-docker-demo.git"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: "${GIT_REPO}"
            }
        }

        stage('Build with Maven') {
            steps {
                echo 'Building Spring Boot project...'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image locally...'
                sh "docker build -t ${DOCKER_IMAGE}:latest ."
            }
        }
    }

    post {
        success {
            echo 'Build and Docker image creation completed successfully!'
        }
        failure {
            echo 'Something went wrong. Check the logs!'
        }
    }
}