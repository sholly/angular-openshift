pipeline {
  agent {
    node {
        label 'nodejs'
    }
  }

  stages {
    stage ('preamble'){
      steps {
        script {
          openshift.withCluster() {
            openshift.withProject() {
              echo "Project: ${openshift.project()}"
              sh "oc get project"

            }
          }
        }
      }
    }

    stage ('package') {
      steps {
        script {
          sh "npm install"
          sh "npm run build"
          sh "chown -R 1001:1001 ./dist"
        }
      }
    }
    
     stage ('Build development image') {
       steps {
         script {
             openshift.withCluster() {
                 openshift.withProject() {
                     openshift.selector("bc", "angular-openshift").startBuild("--from-dir=./dist", "--wait=true")
                 }
                 }
             }
         }
       }
  }
}
