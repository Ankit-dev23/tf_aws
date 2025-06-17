pipeline {
    agent any

    environment {
        TF_ENV = "${params.ENVIRONMENT}"
        AWS_DEFAULT_REGION = 'ap-south-1'
    }

    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'prod'], description: 'Select environment')
        booleanParam(name: 'AUTO_APPLY', defaultValue: false, description: 'Auto-apply Terraform plan?')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Ankit-dev23/tf_aws.git/'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                terraform init \
                  -backend-config="key=${TF_ENV}/terraform.tfstate" \
                  -backend-config="bucket=my-terraform-state-bucket" \
                  -backend-config="region=ap-south-1" \
                  -backend-config="dynamodb_table=my-lock-table"
                '''
            }
        }

        stage('Select Workspace') {
            steps {
                sh '''
                terraform workspace select ${TF_ENV} || terraform workspace new ${TF_ENV}
                '''
            }
        }

        stage('Terraform Format & Validate') {
            parallel {
                stage('Format Check') {
                    steps {
                        sh 'terraform fmt -check -recursive'
                    }
                }
                stage('Validate') {
                    steps {
                        sh 'terraform validate'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Manual Approval') {
            when {
                expression { return !params.AUTO_APPLY }
            }
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    input message: "Apply Terraform changes to ${params.ENVIRONMENT}?"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        success {
            echo "Terraform changes applied successfully."
        }
        failure {
            echo "Pipeline failed."
        }
    }
}
