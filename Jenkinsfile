pipeline {
    agent  {
        label 'learning'
        } // Use a Windows agent for Node.js}

    stages {
        stage('Cleanup') {
            steps {
                cleanWs()
            }
        }
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
        stage('Test') {
            steps {
                script {
                    // Run tests
                    bat 'ng test --watch=false --browsers=ChromeHeadlessNoSandbox && echo "Tests completed"'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Deploy the application (customize this step as needed)
                    echo 'Deploying application...'
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
