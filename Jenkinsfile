@Library('github.com/releaseworks/jenkinslib') _

pipeline {
    agent { 
        docker {
            image 'mikestesen/maven-eb:1.0'
            args '-v /root/.m2:/root/.m2'
         }
    }
    stages {
        stage('Deploy Infrastructure'){
            steps {
                withAWS(region:'us-east-2',credentials:'mike_nesets'){
                    cfnUpdate(stack:'eb-test', file:'infrastructure/EB_test.template')
                }
            }
        }
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        stage('Upload') {
            steps {
                withAWS(region:'us-east-2',credentials:'mike_nesets'){
                    s3Upload(file:'target/root.war', bucket:'nesets-tomcat-eb', path:'root.war')
                }
            }
        }
        stage('Dev_App') {
            steps {
                withAWS(region:'us-east-2',credentials:'mike_nesets'){
                        sh 'aws elasticbeanstalk create-application-version --application-name eb-test-SampleApplication-1BBWUAQIO9HMT --version-label 1.0.0 --source-bundle S3Bucket=nesets-tomcat-eb,S3Key=root.war && aws elasticbeanstalk update-environment --application-name eb-test-SampleApplication-1BBWUAQIO9HMT --environment-name eb-t-Samp-Z59L6O7TEMHM --version-label 1.0.0'
                }
            }
        }
    }
}
