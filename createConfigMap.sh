kubectl delete configmap robo-fullfillorder-config --namespace="robo-prod"
kubectl create configmap robo-fullfillorder-config --from-file=config.env --namespace="robo-prod"
