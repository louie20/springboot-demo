node('master') {
  stage('Clone') {
    checkout scm
  }
  stage ('bulid'){
    sh 'tar -zcvf hello.tar.gz *';   
  } 
  stage ('Publish'){
    def server = Artifactory.server 'Defalut Artifactory servers'
    def uploadSpec = """{
      "files": [
        {
          "pattern": "hello.tar.gz",
          "target": "maven-private/${BUILD_NUMBER}/",
          "props": "bulid=Yes"
        }
      ]
    }"""
    server.upload(uploadSpec)
  }
}
