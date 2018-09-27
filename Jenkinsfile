pipeline {
    agent any

     triggers {
         pollSCM('* * * * *')
     }

    stages {
        stage('Build') {
            steps {
                echo 'Building'
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

    // publish html
        publishHTML ([
        allowMissing: false,
        alwaysLinkToLastBuild: false,
        keepAll: true,
        reportDir: ‘coverage’,
        reportFiles: ‘index.html’,
        reportName: “RCov Report”
        ])
    }
}