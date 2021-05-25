node
{
    def mavenHome=tool name:'maven3.8.1'
    stage('checkout code from git'){
    git credentialsId: '56235527-1683-4e97-868e-e1261d703ed4', url: 'https://github.com/AgroTechFarms/maven-web-application.git'        
    }
    stage('build the code'){
        sh "${mavenHome}/bin/mvn clean package"
    }
    stage('executeSonarQubeReport')
    {
        sh "${mavenHome}/bin/mvn sonar:sonar"
    }
    stage('codecoverage')
    {
     jacoco()
    }
    stage('uploadArtifcatintoNexus')
    {
        sh "${mavenHome}/bin/mvn deploy"    
    }
    stage("Deploy application into Tomcat server")
    {
        sshagent(['873fb9f7-4ccb-4775-92f1-6eac49063681'])
        {
         sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.127.86.13:/opt/apache-tomcat-9.0.45/webapps"
        }
    }
    stage("SentEmailnotification")
    {
        emailext body: '''Build is sucessfull ,
        regards,
        Agrotech,
        shiva B''', subject: ' build over', to: 'agrotech.ninja@gmail.com'
    }
    
}
