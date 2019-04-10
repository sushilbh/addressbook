node('maven'){
    def mavenHome = tool name: 'maven360', type: 'maven'
stage('checking out SCM'){
    git credentialsId: 'git-credentials', url: 'https://github.com/sushilbh/addressbook.git'
}
stage('Executing test cases'){
   sh "${mavenHome}/bin/mvn clean compile"
   sh "${mavenHome}/bin/mvn clean test surefire-report:report-only" 
   junit 'target/surfire-reports/*.xml'
}
stage('Packaging software'){
    sh "${mavenHome}/bin/mvn package"
}
stage('Archiving package'){
    archiveArtifacts 'target/surfire-reports/*'
}
stage('Publishing HTML reports'){
    publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/site/', reportFiles: 'surefire-report.html', reportName: 'publish-by-sushil', reportTitles: ''])
}
}
