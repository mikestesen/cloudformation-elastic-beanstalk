@Library('github.com/releaseworks/jenkinslib') _

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
                    s3Upload(file:'target/root.war', bucket:'nesets-tomcat-eb', path:'root.war')
                }
            }
        }
        stage('Deploy') {
            steps {
                withAWS(region:'us-east-2',credentials:'mike_nesets'){
                    cfnUpdate(stack:'eb-test', file:'infrastructure/EB_test.template')
                }
            }
        }
    }
}