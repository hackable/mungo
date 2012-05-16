#!/bin/bash

source ./config

# declare directory variable
REPO_BASE="$PARENT_DIR"repos/
SITE_BASE="$PARENT_DIR"sites/
COMMAND=$1
NAME=$2

function create() {
  
echo "Creating repository & site"

mkdir "$REPO_BASE.$NAME"

echo "Initializing... repository" 

cd $REPO_BASE.$NAME

git --git-dir=.  --work-tree=$SITE_BASE.$NAME init

git --bare update-server-info

git config core.bare false

git config receive.denycurrentbranch ignore

echo "Installing post receive hooks.."

cp -rf post-receive $REPO_BASE.$NAME/hooks/

chmod +x $REPO_BASE.$NAME/hooks/post-receive

echo "Your site $dir has been created is ready for launch..."

}


function destory() {

echo "Destorying your repo & site..."

rm -rf  $SITE_BASE.$NAME

rm -rf  $REPO_BASE.$NAME

echo "Your $dir repo & site  has been successfully"

}


case $COMMAND in
--create)
   create $NAME
   ;;
--destory)
   destory $NAME
   ;;
--version)
   echo $VERSION
*)
   echo "No option is not recognized"
   ;;
esac
