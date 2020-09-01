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
                s3Upload(file:'tomcat-hello-1.0.zip', bucket:'nesets-tomcat-eb', path:'target/hello-world-1.0.zip')
            }
        }
    }
}