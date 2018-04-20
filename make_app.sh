#!/bin/bash

NAME="project_name"
REPO="https://repo_name.git"

clear
echo "Setting up flask app for $NAME"
mkdir $NAME

#setting up virtual env first
echo "Setting up virtual environment"
cd $NAME
python3 -m venv venv
source venv/bin/activate
pip install flask
echo "..done!"

#set up git repo next
echo "Setting up repository"
git init
echo "# $NAME" >> README.md
echo "venv/*" >> .gitignore
echo "__pycache__/*" >> .gitignore
echo "*__pycache__/*" >> .gitignore
echo "*.pyc" >> .gitignore

git add .
git commit -m "initial commit"
git remote add origin $REPO
git push -u origin master
echo "..done!"

#then make flask app
echo "Setting up directory structure"
mkdir app/
mkdir app/templates
mkdir app/static
mkdir program/
echo "..done!"

#create __init__.py and routes.py
echo "Setting up basic files"
cd app/
echo -e 'from flask import Flask\n' >> __init__.py
echo -e 'app = Flask(__name__)\n' >> __init__.py
echo 'from app import routes' >> __init__.py

echo -e 'from app import app\n' >> routes.py
echo '@app.route("/")' >> routes.py
echo '@app.route("/index/")' >> routes.py
echo 'def index():' >> routes.py
echo '    return "Hello World"!' >> routes.py

cd ..

#create run.py
echo 'from app import app' >> run.py

#update venv/bin/activate
echo '\n# user flask settings' >> venv/bin/activate
echo 'export FLASK_APP=run.py' >> venv/bin/activate
echo 'export FLASK_DEBUG=1' >> venv/bin/activate
echo "..done!"

#save to git
echo "Saving everything to github"
git add .
git commit -m "set up flask app"
git push

deactivate
cd ..
echo "Everything done!"
