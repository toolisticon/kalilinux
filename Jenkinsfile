properties properties: [
        [$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '30', numToKeepStr: '10']],
        disableConcurrentBuilds()
]

@Library('holisticon-build-library')
def build = new de.holisticon.ci.jenkins.Build()
def notify = new de.holisticon.ci.jenkins.Notify()

node {
    def buildNumber = env.BUILD_NUMBER
    def branchName = env.BRANCH_NAME
    def workspace = env.WORKSPACE
    def buildUrl = env.BUILD_URL
    def image

    // PRINT ENVIRONMENT TO JOB
    echo "workspace directory is $workspace"
    echo "build URL is $buildUrl"
    echo "build Number is $buildNumber"
    echo "branch name is $branchName"
    echo "PATH is $env.PATH"

    try {
        stage('Checkout') {
            deleteDir()
            checkout scm
        }

        stage('Build') {
            image = docker.build('toolisticon/kalilinux')
        }

        stage('Test') {
            image.inside {
              sh '/usr/bin/fierce -dns blog.holisticon.de'
            }
        }

        stage('Deploy') {
            docker.withRegistry('https://registry-1.docker.io/v2/', 'docker-hub-holisticon') {
                image.push("${buildNumber}")
            }
        }

    } catch (e) {
        notify.buildMessage(currentBuild, true, 'holi-oss', 'Error with recent changes: ' + build.summarizeBuild(currentBuild))
        throw e
    }

}
