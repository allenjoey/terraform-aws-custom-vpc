/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    tools {
        'org.jenkinsci.plugins.terraform.TerraformInstallation' 'terraform'
    }
    triggers {
        pollSCM 'H/5 * * * *'
    }

    stages {
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform format') {
            steps {
                sh 'terraform fmt -check -recursive'
            }
        }
        stage('Terraform validate') {
            steps {
                sh 'terraform validate'
            }
        }
        stage('Terraform plan') {
            steps {
                sh 'terraform plan -out=plan.out'
            }
        }
        stage('Terraform apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        always {
            step([$class: 'Mailer', notifyEveryUnstableBuild: true,
                recipients: ''])
        }
    }
}
