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
            agent{
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }
            steps {
                sh '''
                    test -f build/index.html
                    echo "Hello Test stage"
                    npm test
                '''
            }
        }
        stage('Deploy') {
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
                    npm install -g netlify-cli
                    node_modules/.bin/netlify --version
                    pwd
                    ls -la
                '''
            }
        }
    }
    post {
        always {
            junit 'test-results/junit.xml'
            echo "Cleaning up..."
        }
    }
}
