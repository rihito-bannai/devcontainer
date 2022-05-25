cd /home/workspace
touch .gitignore
cp /home/workspace/.devcontainer/create_app/.gitignore /home/workspace/.gitignore
poetry new argent
cd argent
mv README.rst README.md
poetry add django@3.2.13
cd argent
poetry run django-admin startproject conf .
poetry add environs[django]@9.5.0
touch .env
cp /home/workspace/.devcontainer/create_app/.env /home/workspace/argent/argent/.env
mkdir templates
touch templates/base.html
cp /home/workspace/.devcontainer/create_app/base.html /home/workspace/argent/argent/templates/base.html
mkdir -p static/css
mkdir static/js
touch static/css/base.css
touch static/js/base.js
cp /home/workspace/.devcontainer/create_app/settings.py /home/workspace/argent/argent/conf/settings.py
cd /home/workspace
git init
git config --local user.email "you@example.com"
git config --local user.name "Your Name"
git config --local core.editor "code --wait"
git add -A
git commit -m "セットアップ"
bash