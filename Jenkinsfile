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
          sh "apk update && apk upgrade && apk add make && make install build"
        }
        container('kaniko') {
          sh "/kaniko/executor --force --dockerfile Dockerfile --context . --destination cr.marsh.gg/marshians/logo:latest"
        }
      }
    }
  }
}
