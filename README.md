# containrize-ezlearning-pipeline-minikube
# configure ssh key for github 
ssh-keygen -t ed25519 -C "xxxxxx@gmail.com"
give a passphrase 
eval "$(ssh-agent -s)"
ssh-add /home/dorra/.ssh/gitub_key
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