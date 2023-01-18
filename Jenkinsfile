pipeline {
    agent any
    stages {
        stage('init') {
            steps {
                sh 'terraform init'}
                }
        stage('validate') {
            steps {
                    sh 'terraform validate'
                }
            }
        stage('TF-plan') {
            steps {
                    sh 'terraform plan'
                    sh 'terraform plan -out tf.plan'
                    sh 'terraform show -json tf.plan > tf.json'
                }
            }
        stage('checkov') {
            steps { 
                sh 'checkov -d . --external-checks-git https://github.com/Saintmori/chekov-checks.git -c CKV_AWS_CUSTOM_TYPES -c CKV_AWS_CUSTOM_TAGS'
                }
            }
        }
    }