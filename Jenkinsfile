pipeline {
    agent any
    environment {
        TF_VERSION = '1.0.0' // Specify your Terraform version here
    }
    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'test', 'stage', 'prod'], description: 'Select the deployment environment')
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Initialize Terraform') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    script {
                        // Initialize Terraform
                        sh "terraform init"
                    }
                }
            }
        }
        stage('Plan Terraform') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    script {
                        // Show what Terraform plans to do
                        sh "terraform plan"
                    }
                }
            }
        }
        stage('Apply Terraform') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    script {
                        // Apply the Terraform configuration
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
    }
    post {
        always {
            // Clean up workspace
            cleanWs()
        }
    }
}
