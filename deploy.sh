set -e

NAME="application-testing-api"
USERNAME="pran4450"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image..."
docker build -t $IMAGE .

echo "Pushing image to Docker Hub..."
sudo docker push $IMAGE

echo "Applying K8s manifests..."
kubectl apply -f K8s/deployment.yaml
kubectl apply -f K8s/service.yaml

echo "Geting pods..."
kubectl get pods

echo "Geting services..."
kubectl get services

echo "Fetching main service"
kubectl get service $NAME-service
