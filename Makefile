# Dockerfile should pass hadolint
# app.py should pass pylint
# optional, but recommended, build a simple integration test

setup:
	# Create python virtualenv & source it
	python3 -m venv venv

# This should be run from inside a virtualenv
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	# optional tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

# This should be run from inside a virtualenv
lint:
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	pylint --disable=R,C,W1203 app.py

# This should be run from inside a virtualenv
all: install lint test