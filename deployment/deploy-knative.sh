sudo apt-get install jq
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.11.1/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.11.1/serving-core.yaml
kubectl apply -l knative.dev/crd-install=true -f istio.yaml
kubectl apply -f istio.yaml
kubectl apply -f https://github.com/knative/net-istio/releases/download/knative-v1.11.0/net-istio.yaml
kubectl --namespace istio-system get service istio-ingressgateway
#kubectl get pods -n knative-serving
#kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.11.1/serving-default-domain.yaml