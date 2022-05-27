cd /home/workspace
rm -rf .git
touch .gitignore
cp /home/workspace/.devcontainer/app/create_app/.gitignore /home/workspace/.gitignore
poetry new $1
cd $1
mv README.rst README.md
poetry add django@$2.$3
cd $1
poetry run django-admin startproject conf .
poetry add environs[django]@$4
touch .env
cp /home/workspace/.devcontainer/app/create_app/.env /home/workspace/$1/$1/.env
mkdir templates
touch templates/base.html
cp /home/workspace/.devcontainer/app/create_app/base.html /home/workspace/$1/$1/templates/base.html
mkdir -p static/css
mkdir static/js
touch static/css/base.css
touch static/js/base.js
cp /home/workspace/.devcontainer/app/create_app/django_$2/settings.py /home/workspace/$1/$1/conf/settings.py
cd /home/workspace
git init
bash