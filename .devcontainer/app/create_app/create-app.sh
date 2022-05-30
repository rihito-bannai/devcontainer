cd /home/workspace
rm -rf .git
touch .gitignore
cp /home/workspace/.devcontainer/app/create_app/.gitignore /home/workspace/.gitignore
poetry new $PROJECT_NAME
cd $PROJECT_NAME
mv README.rst README.md
poetry add django@$DJANGO_MAJOR_VERSION.$DJANGO_MINOR_VERSION
cd $PROJECT_NAME
poetry run django-admin startproject conf .
poetry add environs[django]@$ENVIRONS_VERSION
touch .env
cp /home/workspace/.devcontainer/app/create_app/.env /home/workspace/$PROJECT_NAME/$PROJECT_NAME/.env
mkdir templates
touch templates/base.html
cp /home/workspace/.devcontainer/app/create_app/base.html /home/workspace/$PROJECT_NAME/$PROJECT_NAME/templates/base.html
mkdir -p static/css
mkdir static/js
touch static/css/base.css
touch static/js/base.js
poetry add mysqlclient
poetry add dj-database-url
poetry run python3 manage.py startapp accounts
cp /home/workspace/.devcontainer/app/create_app/django_$DJANGO_MAJOR_VERSION/settings.py /home/workspace/$PROJECT_NAME/$PROJECT_NAME/conf/settings.py
cp /home/workspace/.devcontainer/app/create_app/django_$DJANGO_MAJOR_VERSION/accounts/models.py /home/workspace/$PROJECT_NAME/$PROJECT_NAME/accounts/models.py
cp /home/workspace/.devcontainer/app/create_app/django_$DJANGO_MAJOR_VERSION/accounts/admin.py /home/workspace/$PROJECT_NAME/$PROJECT_NAME/accounts/admin.py
cp /home/workspace/.devcontainer/app/create_app/django_$DJANGO_MAJOR_VERSION/accounts/forms.py /home/workspace/$PROJECT_NAME/$PROJECT_NAME/accounts/forms.py
poetry run python3 manage.py makemigrations accounts
cd /home/workspace
git init
bash