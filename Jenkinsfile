pipeline {
    agent any

     triggers {
         pollSCM('* * * * *')
     }

    stages {
        stage('Build') {
            steps {

                // Checkout
                checkout scm

                echo 'Building'

                // publish html
                publishHTML([
                allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true, reportDir: '',
                reportFiles: 'index.html',
                reportName: 'HTML Report',
                reportTitles: ''])
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

        stage('Front-end') {
            agent {
                docker { image 'node:7-alpine' }
            }
            steps {
                sh 'node --version'
            }
        }
    }
}