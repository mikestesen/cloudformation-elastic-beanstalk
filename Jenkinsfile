pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        stage('Upload') {
            steps {
                withAWS(region:'us-east-2',credentials:'mike_nesets'){
                    s3Upload(file:'target/hello-world-1.0.zip', bucket:'nesets-tomcat-eb', path:'hello-world-1.0.zip')
                }
            }
        }
        stage('Deploy') {
            steps {
                withAwsCli(
                    credentialsId: 'mike_nesets',
                    defaultRegion: 'us-east-2') {
                    sh '''
                        # Deploy CloudFormation Template
                        aws cloudformation deploy --template infrastrcture/EB_test.template --stack-name eb-test
                        '''
                    }
            }
        }
    }
}