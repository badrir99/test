pipeline{
    agent{
        any
    }
    stages{
        stage("Git checkout"){
            steps{
                echo 'Perform SCM Checkout'
                git 'https://github.com/badrir99/test.git'  
            }
           
        }
        stage('Build') {
            steps {
                echo 'Hello World'
				sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage('Deploy to QA Server') {
            steps {
                echo 'Hello World'
            }
        }
        post {
            always {
                echo 'This will always run'
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
    
}