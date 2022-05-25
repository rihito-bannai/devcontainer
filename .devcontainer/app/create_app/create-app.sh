cd /home/workspace
touch .gitignore
cp /home/workspace/.devcontainer/app/$1_app/.gitignore /home/workspace/.gitignore
poetry new $2
cd $2
mv README.rst README.md
poetry add django@$3.$4
cd $2
poetry run django-admin startproject conf .
poetry add environs[django]@$5
touch .env
cp /home/workspace/.devcontainer/app/$1_app/.env /home/workspace/$2/$2/.env
mkdir templates
touch templates/base.html
cp /home/workspace/.devcontainer/app/$1_app/base.html /home/workspace/$2/$2/templates/base.html
mkdir -p static/css
mkdir static/js
touch static/css/base.css
touch static/js/base.js
cp /home/workspace/.devcontainer/app/$1_app/django_$3/settings.py /home/workspace/$2/$2/conf/settings.py
cd /home/workspace
git init
git config --local user.email "$6"
git config --local user.name "$7"
git config --local core.editor "code --wait"
git add -A
git commit -m "新規プロジェクト作成"
bash