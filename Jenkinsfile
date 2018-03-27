node {
  def project = 'roboeventhublistener'
  def appName = 'gceme'
  def feSvcName = "roboeventhublistener"
  def imageTag = "rabbitsabbour/eventhublistenerackmq"
  

  checkout scm

  stage "Deploy Application"
  
  sh("sed -i.bak 's#NAMESPACE#${env.BRANCH_NAME}#' ./k8s/*.yaml")
  switch (env.BRANCH_NAME) {
    // Roll out to production
    case "robo-prod":
        // Change deployed image in canary to the one we just built
        sh("sed -i.bak 's#DOCKER-IMAGE#${imageTag}#' ./k8s/*.yaml")
        sh("kubectl --namespace=robo-prod apply -f k8s/")
            break
  // Roll out to production
    case "robo-dev":
        // Change deployed image in canary to the one we just built
        sh("sed -i.bak 's#docker/image#${imageTag}#' ./k8s/*.yaml")
        sh("kubectl --namespace=robo-dev apply -f k8s/")
            break
    // Roll out a dev environment
    default:
        echo 'To access your environment run `kubectl proxy`'
        echo "Then access your service via http://localhost:8001/api/v1/proxy/namespaces/${env.BRANCH_NAME}/services/${feSvcName}:80/"
  }
}


