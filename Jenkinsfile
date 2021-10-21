pipeline {
    agent none
    stages {
        stage('Run Tests') {
            parallel {
                stage('Test Parallel 1') {
                    steps {
                       echo "Parallel 1"
                    }
                }
                stage('Test Parallel 2') {
                    steps {
                        echo "Parallel 2"
                    }
                }
            }
        }
        stage("Stage 2") {
            steps {
                echo "Stage 2"
            }
        }
    }
}
