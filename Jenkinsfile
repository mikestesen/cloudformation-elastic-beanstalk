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
                s3Upload(file:'target/tomcat-hello-1.0.zip', bucket:'nesets-tomcat-eb', path:'hello-world-1.0.zip')
            }
        }
    }
}