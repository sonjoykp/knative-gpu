kubectl delete -f https://github.com/knative/serving/releases/download/knative-v1.11.1/serving-hpa.yaml
kubectl delete -f https://github.com/knative/net-certmanager/releases/download/knative-v1.11.1/release.yaml
kubectl delete -f https://github.com/knative/net-http01/releases/download/knative-v1.11.1/release.yaml


#Istio
kubectl delete -f https://github.com/knative/net-istio/releases/download/knative-v1.11.0/net-istio.yaml
kubectl delete -f https://github.com/knative/net-istio/releases/download/knative-v1.11.0/istio.yaml

#Magic DNS (sslip.io)
kubectl delete -f https://github.com/knative/serving/releases/download/knative-v1.11.1/serving-default-domain.yaml

#Serving Component
kubectl delete -f https://storage.googleapis.com/knative-nightly/serving/latest/serving-core.yaml
kubectl delete -f https://storage.googleapis.com/knative-nightly/serving/latest/serving-crds.yaml


#Kafka
kubectl delete -f https://github.com/knative/eventing/releases/download/knative-v1.11.4/eventing-sugar-controller.yaml
kubectl delete -f https://github.com/knative-sandbox/eventing-kafka-broker/releases/download/knative-v1.11.6/eventing-kafka-source.yaml

#Broker
kubectl delete -f https://github.com/knative-sandbox/eventing-kafka-broker/releases/download/knative-v1.11.6/eventing-kafka-broker.yaml
kubectl delete -f https://github.com/knative-sandbox/eventing-kafka-broker/releases/download/knative-v1.11.6/eventing-kafka-controller.yaml

#Kafka Channel
kubectl delete -f https://github.com/knative-sandbox/eventing-kafka-broker/releases/download/knative-v1.11.6/eventing-kafka-channel.yaml


#Knative Eventing
kubectl delete -f https://storage.googleapis.com/knative-nightly/eventing/latest/eventing-core.yaml
kubectl delete -f https://storage.googleapis.com/knative-nightly/eventing/latest/eventing-crds.yaml

yes | sudo kubeadm reset
sudo rm -r $HOME/.kube