@echo off

echo Running with %python%

echo Creating and populating virtualenv..
python -m venv venv
venv\Scripts\activate.bat

pip install --upgrade pip pip-tools wheel
make

cd src

echo Collecting static assets...
python manage.py collectstatic

echo Running initial migrations...
python manage.py migrate

cd ../
echo Apply formatting..
make fmt

echo Running flake8..
make lint

echo Running pytest...
make test

echo Done
