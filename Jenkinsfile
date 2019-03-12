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
        archiveArtifacts '**/target/*.jar'
    }
    stage('deployment'){
        sshagent(['deployusr']) {
    // some block
       
      //  sh "ssh -o StrictHostKeyChecking=no deployusr@10.0.0.53 /opt/tomcat/start.sh"
      //  sh "scp -o StrictHostKeyChecking=no /home/ec2-user/workspace/pipeline/target/my-app-1-RELEASE.jar deployusr@10.0.0.53:/opt/tomcat/webapp"
      //  sh "ssh -o StrictHostKeyChecking=no deployusr@10.0.0.53 /opt/tomcat/stop.sh"
    }
}
