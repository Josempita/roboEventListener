kubectl delete configmap robo-eventlistener-config --namespace="robo-dev"
kubectl create configmap robo-eventlistener-config --from-file=config.env --namespace="robo-dev"
