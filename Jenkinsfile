@Library('github.com/releaseworks/jenkinslib') _

pipeline {
    agent { 
        dockerfile {
            filename 'dockerfile.build'
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
                        sh ''' aws s3 ls '''
                }
            }
        }
    }
}
