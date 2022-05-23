cd /home/project
touch .gitignore
cp /home/project/.devcontainer/setup_project/.gitignore /home/project/.gitignore
poetry new argent
cd argent
mv README.rst README.md
poetry add django@3.2.13
cd argent
poetry run django-admin startproject conf .
poetry add environs[django]@9.5.0
touch .env
cp /home/project/.devcontainer/setup_project/.env /home/project/argent/argent/.env
mkdir templates
touch templates/base.html
cp /home/project/.devcontainer/setup_project/base.html /home/project/argent/argent/templates/base.html
mkdir -p static/css
mkdir static/js
touch static/css/base.css
touch static/js/base.js
cp /home/project/.devcontainer/setup_project/settings.py /home/project/argent/argent/conf/settings.py
cd /home/project
git init
git config --local user.email "you@example.com"
git config --local user.name "Your Name"
git config --local core.editor "code --wait"
git add -A
git commit -m "セットアップ"