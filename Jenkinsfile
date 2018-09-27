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
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: true, reportDir: 'coverage', reportFiles: 'index.html', reportName: 'RCov Report', reportTitles: ''])
            }
        }
        stage('Test') {
            steps {
                echo 'Testing'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying'
            }
        }
    }
}