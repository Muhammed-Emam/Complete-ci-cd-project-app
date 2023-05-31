pipeline {
    agent {
        label 'slave'
    }

    stages {
        stage('Clone CI Repository') {
            steps {
                git 'https://github.com/Muhammed-Emam/Complete-ci-cd-project.git'
            }
        }

        stage('ci') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKERPASS', usernameVariable: 'DOCKERENAME')]) {
                    sh """ 
                    docker build . -t muhammedemam/wep-app
                    docker login -u ${DOCKERENAME} -p ${DOCKERPASS}
                    docker push muhammedemam/wep-app
                    """
                }
            }
        }

        stage('Clone CD Repository') {
            steps {
                git 'https://github.com/Muhammed-Emam/Complete-ci-cd-project-app.git'
            }
        }

        stage('cd') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKERPASS', usernameVariable: 'DOCKERENAME')]) {
                    sh """
                    docker login -u ${DOCKERENAME} -p ${DOCKERPASS}
                    kubectl delete deployment --all -n simple-web
                    kubectl apply -f namespace.yaml
                    kubectl apply -f deployment.yaml
                    kubectl apply -f service.yaml
                    """
                }
            }
        }
    }
}
