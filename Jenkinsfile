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
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: true, keepAll: true, reportDir: '', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
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