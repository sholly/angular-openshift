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
        }
      }
    }
    
     stage ('Build development image') {
       steps {
         script {
             openshift.withCluster() {
                 openshift.withProject() {
                     openshift.selector("bc", "angular-openshift").startBuild("--from-dir=./dist/angular-openshift", "--wait=true")
                 }
                 }
             }
         }
       }
  }
}
