node('master') {
  tools {
       // Install the Maven version configured as "M3" and add it to the path.
       maven "M3"
  }
  stage('Clone') {
    checkout scm
  }
  stage ('bulid'){
    //sh 'tar -zcvf hello.tar.gz *';  
    // Get some code from a GitHub repository
    git 'https://github.com/jglick/simple-maven-project-with-tests.git'

    // Run Maven on a Unix agent.
    sh "mvn -Dmaven.test.failure.ignore=true clean package"
    
    //junit '**/target/surefire-reports/TEST-*.xml'
    archiveArtifacts 'target/*.jar'
    
  } 
  stage ('Publish'){
    def server = Artifactory.server 'Defalut Artifactory servers'
    def uploadSpec = """{
      "files": [
        {
          "pattern": "target/*.jar",
          "target": "maven-private/${BUILD_NUMBER}/",
          "props": "bulid=Yes"
        }
      ]
    }"""
    server.upload(uploadSpec)
  }
}
