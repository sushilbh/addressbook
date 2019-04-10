node('maven'){
    def mavenHome = tool name: 'maven360', type: 'maven'
}
stage('checking out SCM'){
    git credentialsId: 'git-credentials', url: 'https://github.com/sushilbh/addressbook.git'
}
