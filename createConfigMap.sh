kubectl delete configmap robo-eventlistener-config --namespace="robo-prod"
kubectl create configmap robo-eventlistener-config --from-file=config.env --namespace="robo-prod"
