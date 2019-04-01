node('maven'){
     def mvnhome = tool name: 'maven360', type: 'maven'
    stage('Git upload'){
   //     git credentialsId: 'demo', url: 'https://github.com/Prabhu4tx/addressbook'
        
    }
    stage('Maven build'){
        //def MavenHome = tool name: 'maven', type: 'maven'
        //def mvnCMD = "${MavenHome}/bin/mvn"
        //sh "${mvnCMD} clean compile"
        //sh "${mvnCMD} package"
         sh "$mvnhome/bin/mvn clean test surefire-report:report-only"
        
    }
    stage ('package'){
        sh "$mvnhome/bin/mvn clean package -DskipTests=true"
    }
    stage('archieving artifacts'){
        archiveArtifacts '**/target/*'
    }
       stage('Post Build Actions'){
        sh '''
        echo "file status" | mutt -s "file hasn't arrived" robin.awscloud@gmail.com
        '''
    }
   stage('deployment'){
     sshagent(['git_key_shared_local']) {
    sh "scp -o StrictHostKeyChecking=no /home/ec2-user/workspace/pipeline/addressbook_main/target/addressbook.war deployusr@54.211.236.217:/home/deployusr/"
}
        sh "$mvnhome/bin/mvn clean install"
        //cp  /home/ec2-user/workspace/pipeline2/addressbook_main/target*.war /opt/tomcat/webapp


       
       //sh "ssh -o StrictHostKeyChecking=no ec2-user@35.153.80.91 /opt/tomcat/start.sh"
       //sh "scp -o StrictHostKeyChecking=no /home/ec2-user/workspace/pipeline2/addressbook_main/target/addressbook.war ec2-user@35.153.80.91:/opt/tomcat/"
       //sh "ssh -o StrictHostKeyChecking=no ec2-user@35.153.80.91 /opt/tomcat/stop.sh"
   }

}
