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
                s3Upload(file:'tomcat-hello.zip', bucket:'nesets-tomcat-eb', path:'path/to/target/file.txt')
            }
        }
    }
}