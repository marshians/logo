pipeline {
  agent {
    kubernetes {
      yamlFile 'build-pods.yaml'
    }
  }
  stages {
    stage ('build and push') {
      steps {
        container('build') {
          sh "make install build"
        }
        container('kaniko') {
          sh "/kaniko/executor --dockerfile Dockerfile --context . --destination cr.marsh.gg/marshians/logo:latest"
        }
      }
    }
  }
}
