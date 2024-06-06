# containrize-ezlearning-pipeline-minikube
# configure ssh key for github 
ssh-keygen -t ed25519 -C "xxxxxx@gmail.com"  
give a passphrase (dorra)  
eval "$(ssh-agent -s)"  
ssh-add /home/dorra/.ssh/gitub_key  
create file .ssh/config and include in it the /home/dorra/.ssh/gitub_key   
add you public key to github using UI  
ssh -T git@github.com  
# configure new repo
echo "# containrize-ezlearning-pipeline-minikube" >> README.md  
git init  
git add README.md  
git commit -m "first commit"  
git branch -M master  
git remote add origin git@github.com:DorraBenLetayfa/containrize-ezlearning-pipeline-minikube.git  
git push -u origin master  
# build application locally 
mvn package
# run the application locally
java -jar ez-learning/target/platform-0.0.1-SNAPSHOT.jar
# run this command inside the ez-learning
chmod +x mvnw
# build the container using buildah
buildah build -t quay.io/dorrabl/learning:latest .
# run the container using buildah
podman run -d -p 8080:8080 quay.io/dorrabl/learning:latest
# deploy mysql on minikube
# deploy application with prod profile on minikube
# deploy jenkins on minikube
# deploy sonarqube on minikube
# deploy trivy on minikube
# create CICD pipeline with jenkins 