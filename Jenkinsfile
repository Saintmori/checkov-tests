pipeline {
    agent any
    parameters {
        choice(name: "checkov", choices: ["CKV_AWS_CUSTOM_TYPES", "CKV_AWS_CUSTOM_TAGS"], description: "checkov checks you want to run on this code")
    }
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
                sh 'checkov -d . --external-checks-git https://github.com/Saintmori/chekov-checks.git -c "$params.checkov"'
                }
            }
        }
    }