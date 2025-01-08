pipeline {
    agent any
    stages {
        stage("AWS Demo") {
            steps {
                withCredentials([
                    [
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-credential',
                        accessKeyVariable: '',
                        secretKeyVariable: ''
                    ]
                ]) {
                    sh "aws s3 ls"
                }
            }
        }
        stage("Building AMI") {
            steps {
                withCredentials([
                    [
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-credential',
                        accessKeyVariable: '',
                        secretKeyVariable: ''
                    ]
                ]) {
                    sh "packer init aws-ubuntu.pkr.hcl"
                    sh "packer build aws-ubuntu.pkr.hcl"
                }
            }
        }
    }
}
