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
   stage('deployment'){
       //sshagent(['deployusr']) {
    // some block
        sh "$mvnhome/bin/mvn clean install"
       
       //sh "ssh -o StrictHostKeyChecking=no ec2-user@35.153.80.91 /opt/tomcat/start.sh"
       //sh "scp -o StrictHostKeyChecking=no /home/ec2-user/workspace/pipeline2/addressbook_main/target/addressbook.war ec2-user@35.153.80.91:/opt/tomcat/"
       //sh "ssh -o StrictHostKeyChecking=no ec2-user@35.153.80.91 /opt/tomcat/stop.sh"
   }

}
