pipeline {
    agent {
        label 'jenkins-agent'
    }

    environment {
        TF_IN_AUTOMATION = "true"

        // Terraform variables (NO hardcoding in code)
        TF_VAR_aws_region      = "ap-south-1"
        TF_VAR_vpc_name        = "main_vpc"
        TF_VAR_subnet_name     = "public1"
        TF_VAR_key_pair_name  = "my-key"
        TF_VAR_s3_bucket_prefix = "terraform-ec2-access"
        TF_VAR_tags = '{"Environment":"dev","Owner":"Birjendra","Project":"terraform-cicd"}
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                  terraform init -input=false
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                  terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                  terraform plan -input=false -out=tfplan
                '''
            }
        }

        stage('Terraform Apply') {
            when {
                branch 'main'
            }
            steps {
                input message: "Approve Terraform Apply?", ok: "Apply"
                sh '''
                  terraform apply -input=false tfplan
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Infrastructure provisioned successfully"
        }
        failure {
            echo "❌ Terraform pipeline failed"
        }
    }
}
