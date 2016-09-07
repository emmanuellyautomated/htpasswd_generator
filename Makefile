PYTHON := python3
FORK := emmanuellyautomated
APP_NAME := htpasswd_generator
APP_FILE := app/htpasswd_generator.py
VENV := $(CURDIR)/venv

$(eval export FLASK_APP=$(APP_FILE))
$(shell source ${VENV}/bin/activate)

all: 
	@echo "FLASK APP -->" ${FLASK_APP}

venv: 
	virtualenv -p python3 $(VENV)

install: requirements.txt $(VENV)
	$(VENV)/bin/pip3 install -r requirements.txt

dev-server:
	flask run	

clean:
	rm -rf $(VENV)
	find . -iname '*.pyc' -exec rm {} \;
