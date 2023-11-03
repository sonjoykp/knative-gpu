#!/bin/bash
sudo kubeadm init
mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl taint nodes --all node-role.kubernetes.io/control-plane-
kubectl apply -f https://docs.projectcalico.org/v3.18/manifests/calico.yaml
# curl -sSL https://github.com/knative/serving/releases/download/knative-v1.10.1/serving-core.yaml \
#   | grep 'gcr.io/' | awk '{print $2}' | sort | uniq \
#   | xargs -n 1 \
#     cosign verify -o text \
#       --certificate-identity=signer@knative-releases.iam.gserviceaccount.com \
#       --certificate-oidc-issuer=https://accounts.google.com

curl -L https://istio.io/downloadIstio | sh -
export PATH="$PATH:/home/sonjoyp/knative-gpu/istio-1.19.3/bin"
istioctl install -y
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.11.1/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.11.1/serving-core.yaml
kubectl apply -l knative.dev/crd-install=true -f istio.yaml
kubectl apply -f istio.yaml
kubectl apply -f https://github.com/knative/net-istio/releases/download/knative-v1.11.0/net-istio.yaml
kubectl --namespace istio-system get service istio-ingressgateway
kubectl get pods -n knative-serving
#kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.11.1/serving-default-domain.yaml