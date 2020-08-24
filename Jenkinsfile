node('master') {
  stage('Poll') {
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
          "target": "hello.tar.gz",
          "props": "bulid=Yes"
        }
      ]
    }"""
    server.upload(uploadSpec)
  }
}
