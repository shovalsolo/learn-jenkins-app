pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                sh '''
                    echo "Hello without docker"
                    pwd
                    ls -la
                    touch container-no.txt
                '''
            }
        }
    }
}
