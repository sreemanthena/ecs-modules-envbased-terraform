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
                git branch: 'feature/sree-terraform-ecs-v1', credentialsId: 'sreemanthena_act_github_token', url: 'git@github.com:sreemanthena/ecs-modules-envbased-terraform.git'
            }
        }
        stage('Initialize Terraform') {
            steps {
                dir("environments/${params.ENVIRONMENT}/${params.SERVICE.toLowerCase()}") {
                    sh 'terraform init'
                }
            }
        }
        stage('Plan Terraform') {
            steps {
                dir("environments/${params.ENVIRONMENT}/${params.SERVICE.toLowerCase()}") {
                    sh "terraform plan -var-file=terraform.tfvars -target=module.${params.SERVICE.toLowerCase()}_${params.ENVIRONMENT}"
                }
            }
        }
        stage('Apply Terraform') {
            steps {
                dir("environments/${params.ENVIRONMENT}/${params.SERVICE.toLowerCase()}") {
                    sh "terraform apply -auto-approve -var-file=terraform.tfvars -target=module.${params.SERVICE.toLowerCase()}_${params.ENVIRONMENT}"
                }
            }
        }
        stage('Approval for Destroy') {
            steps {
                script {
                    def userInput = input(id: 'UserInput', message: 'Do you want to destroy the infrastructure?', ok: 'Yes, destroy it')
                    if (userInput == 'Yes, destroy it') {
                        echo "Proceeding to destroy the infrastructure..."
                    } else {
                        error("Destroy aborted by the user.")
                    }
                }
            }
        }
        stage('Destroy Terraform') {
            steps {
                dir("environments/${params.ENVIRONMENT}/${params.SERVICE.toLowerCase()}") {
                    sh "terraform destroy -auto-approve -var-file=terraform.tfvars -target=module.${params.SERVICE.toLowerCase()}_${params.ENVIRONMENT}"
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
//     stages {
//         stage('Checkout Code') {
//             steps {
//                 //git branch: 'feature/eks-ecs-module-envs', url: 'https://github.com/sreemanthena/eks-ecs-modules-envs-terraform.git'
//                 git branch: 'feature/sree-terraform-ecs-v1', credentialsId: 'sreemanthena_act_github_token', url: 'git@github.com:sreemanthena/ecs-modules-envbased-terraform.git'
//             }
//         }
//         stage('Initialize Terraform') {
//             steps {
//                 dir("environments/${params.ENVIRONMENT}") {
//                     script {
//                         // Initialize Terraform
                        
//                         sh "terraform init"
//                     }
//                 }
//             }
//         }
//         stage('Plan Terraform') {
//             steps {
//                 dir("environments/${params.ENVIRONMENT}") {
//                     script {
//                         // Show what Terraform plans to do
//                         sh "terraform plan"
//                     }
//                 }
//             }
//         }
//         stage('Apply Terraform') {
//             steps {
//                 dir("environments/${params.ENVIRONMENT}") {
//                     script {
//                         // Apply the Terraform configuration
//                         sh "terraform apply -auto-approve"
//                     }
//                 }
//             }
//         }
//     }
//     post {
//         always {
//             // Clean up workspace
//             cleanWs()
//         }
//     }
// }
