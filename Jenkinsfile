pipeline {
    agent any

     triggers {
         pollSCM('* * * * *')
     }

    stages {
        stage('Build') {
            steps {
                echo 'Building'

                // publish html
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
            }
        }
        stage('Test') {
            steps {
                echo 'Testing '
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying'
            }
        }
    }
}