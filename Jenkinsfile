node('maven'){
    def mavenHome = tool name: 'maven360', type: 'maven'
stage('checking out SCM'){
    git credentialsId: 'git-credentials', url: 'https://github.com/sushilbh/addressbook.git'
}
stage('Executing test cases'){
   sh "${mavenHome}/bin/mvn clean compile"
   junit allowEmptyResults: true, testResults:'target/surfire-reports/*.xml'
    sh "${mavenHome}/bin/mvn clean test surefire-report:report-only"
}
stage('Packaging software'){
    sh "${mavenHome}/bin/mvn package"
}
stage('Archiving package'){
    archiveArtifacts allowEmptyArchive: true, artifacts: 'target/surfire-reports/*'
}
stage('Publishing HTML reports'){
    publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/site/', reportFiles: 'surefire-report.html', reportName: 'publish-by-sushil', reportTitles: ''])
}
stage('Sending .war file for backup in AWS S3 Bucket')
withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-iam-key', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
    sh "aws s3 cp /home/ec2-user/workspace/project-2/addressbook_main/target/addressbook.war s3://sushil-bh/"
}
stage('Deploying .war file to the target machine')
sshagent(['bran-new-with-dpak-jee']) {
    sh "scp -o StrictHostKeyChecking=no /home/ec2-user/workspace/project-2/addressbook_main/target/addressbook.war ec2-user@3.86.204.156:/home
}
}
