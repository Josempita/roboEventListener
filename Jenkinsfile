node {
  def project = 'roboeventhublistener'
  def appName = 'roboeventhublistener'
  def feSvcName = "roboeventhublistener"
  def imageTag = "sabbour/eventhublistenerack"
  def teamName = "ROBO-CLUSTERS"

  //-----Dev Env Vars----//
  def devEndpointUrl = "Endpoint=sb://robo-dev-event-hub.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=Ea6RMUMhTXF00gF5cmasQUzYTlVNu//zK8F9dSIt8Hw=;EntityPath=robo-dev-event-hub"
  def devEventHubPath = "robo-dev-event-hub"
  def devProcessEndpoint = "http://fulfill-service.robo-dev:8080/v1/order/"
  
  //-----Prod Env Vars----//
  def prodEndpointUrl = "Endpoint=sb://robo-prod-event-hub.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=22aL/evtJJYC9fwsmfAErXSmaMJ5XkrTfH19Uao4wwE=;EntityPath=robo-prod-event-hub"
  def prodEventHubPath = "robo-prod-event-hub"
  def prodProcessEndpoint = "http://fulfill-service.robo-prod:8080/v1/order/"

  checkout scm

  stage "Deploy Application"
  
  sh("sed -i.bak 's#DOCKER-IMAGE#${imageTag}#' ./k8s/*.yaml")
  sh("sed -i.bak 's#APP-NAME#${appName}#' ./k8s/*.yaml")
  sh("sed -i.bak 's#SVC-NAME#${feSvcName}#' ./k8s/*.yaml")
  sh("sed -i.bak 's#NAME-SPACE#${env.BRANCH_NAME}#' ./k8s/*.yaml")
  sh("sed -i.bak 's#TEAM-NAME#${teamName}#' ./k8s/*.yaml")
  
  switch (env.BRANCH_NAME) {
  // Roll out to dev
    case "robo-dev":
        // Change deployed image in canary to the one we just built
        sh("sed -i.bak 's#ENDPOINT-URL#${devEndpointUrl}#' ./k8s/*.yaml")
        sh("sed -i.bak 's#EVENTHUB-PATH#${devEventHubPath}#' ./k8s/*.yaml")
        sh("sed -i.bak 's#PROCESS-ENDPOINT#${devProcessEndpoint}#' ./k8s/*.yaml")
        sh("kubectl --kubeconfig=/var/kube/config --namespace=robo-dev apply -f k8s/")
            break
    // Roll out to production
    case "robo-prod":
        // Change deployed image in canary to the one we just built
        sh("sed -i.bak 's#ENDPOINT-URL#${prodEndpointUrl}#' ./k8s/*.yaml")
        sh("sed -i.bak 's#EVENTHUB-PATH#${prodEventHubPath}#' ./k8s/*.yaml")
        sh("sed -i.bak 's#PROCESS-ENDPOINT#${prodProcessEndpoint}#' ./k8s/*.yaml")
        sh("kubectl --kubeconfig=/var/kube/config --namespace=robo-prod apply -f k8s/")
            break
    // Roll out a dev environment
    default:
        echo 'Leeroyyy JENKIIIIIIINNNNSSSSSS!!!!!!'
        
  }
}


