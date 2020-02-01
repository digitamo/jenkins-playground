pipeline {
    agent { docker { image 'python:3.7' } }
    options { skipStagesAfterUnstable() }
    environment {
        HOME=${env.WORKSPACE}
    }
    stages {
    stage('Build') {
            steps {
               sh 'pip install --user -r hello/requirements.pip'
            }
        }
    stage('Test') {
            steps {
                sh 'nosetests --with-xunit'
            }
        }
        stage('Deploy') {
        // TODO: Do a proper deployment.
            steps {
                retry(3) {
                    sh './deploy.sh'
                }

                timeout(time: 3, unit: 'MINUTES') {
                    sh './health-check.sh'
                }
            }
        }
    }
    post {
        always {
            echo 'This will always run'
            junit '**/nosetests.xml'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}