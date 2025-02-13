pipeline {
    agent any

    stages {
        stage('Check Ansible Version') {
            steps {
                sh 'ansible --version'
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/FonsahPageo/motina-test.git'
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                script {
                    sh '''
                    docker exec ansible ansible-playbook /ansible/install_git.yml
                    '''
                }
            }
        }
    }
}
