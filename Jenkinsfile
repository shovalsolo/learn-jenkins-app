pipeline {
    agent any

    stages {
        stage('Build') {
            agent{
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }
            steps {
                sh '''
                    pwd
                    ls -la
                    node --version
                    npm --version
                    npm ci
                    npm run build
                    echo "Hello with docker"
                    pwd
                    ls -la
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                    sh "test -f build/index.html"
                    echo "Hello Test stage"
                '''
            }
        }
    }
}
