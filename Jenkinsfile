pipeline {
     agent  {
        label 'learning'
        }

    environment {
        DOCKER_IMAGE = 'suresh176/vetri-learning' // Replace with your Docker Hub username and repository name
        DOCKER_TAG = 'latest'
	DOCKER_PASSWORD = 'Welcomedhiya@1'
	DOCKER_USERNAME = 'suresh176'
    }

    stages {
        stage('Install Dependencies') {
            steps {
                script {
                    // Install Node.js dependencies
                    bat 'npm install'
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    // Build the Angular application
                    bat 'npm run build'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    bat "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Log in to Docker Hub
                    bat 'echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin'

                    // Push the Docker image
                    bat "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        success {
            echo 'Pipeline executed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
