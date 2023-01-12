CLUSTER_NAME="vlcjs"
ARGOCD_MANIFEST="./confs/install.yaml"
# prerequisites: docker k3d and kubectl
# 1. create cluster with 2 agents (one load balancer, and one that will run argocd)
k3d cluster create $CLUSTER_NAME --api-port 6443 -p 8080:80@loadbalancer --agents 2

# 2. create namespaces
kubectl create namespace argocd
kubectl create namespace dev

# 3. launch the argocd pods!
# this operation can fail silently and needs a bit of time
# need to check: kubectl describe pod -A
# need to check: kubectl get pod -n argocd
kubectl apply -n argocd -f $ARGOCD_MANIFEST

# 4. publish the dashboard
# login:
# kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
kubectl port-forward svc/argocd-server -n argocd 8081:443

# 5. create AppProject (cannot create an app without it)
kubectl apply -n argocd -f ./confs/project.yaml

# 6. create Application
kubectl apply -n argocd -f ./confs/application.yaml

# 7. setup port forwarding to access the app
# must wait for the app to be brought up in the dashboard
# (it can take time)
# application.yaml has a hook to a github repository, when we push, we should
# see the changes in the deployment with the command below:

# the port published depends on the one that was set in the manifest.
kubectl port-forward svc/yme-playground -n dev --address localhost 8888:8000

