pipeline {
    agent any
 
    stages {
        stage('Display Branch Name') {
            steps {
                script {
                    echo "Push made to branch: ${env.BRANCH_NAME}"
                    sh 'echo ***************************************************'
                    // Add your additional pipeline steps here
                }
            }
        }
    }
}
