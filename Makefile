deps:
	$(eval VENV := $(shell ls -a | grep .venv))
	@if ! test -n "$(VENV)"; then \
		echo "Can't find '.venv' in current dir."; \
		PIPENV_VENV_IN_PROJECT=true pipenv install; \
	else \
		echo "Virtualenv has already been prepared."; \
	fi

datasets:
	@if [ -e ./data/java14m ]; then \
		echo "already download datasets"; \
	else \
		echo "download datasets"; \
		wget https://s3.amazonaws.com/code2vec/data/java14m_data.tar.gz; \
		tar -xvzf java14m_data.tar.gz; \
		rm java14m_data.tar.gz; \
	fi

trained_model:
	@if [ -e ./models/java14_model ]; then \
		echo "already download trained model"; \
	else \
		echo "download trained model"; \
		wget https://s3.amazonaws.com/code2vec/model/java14m_model.tar.gz; \
		tar -xvzf java14m_model.tar.gz; \
		rm java14m_model.tar.gz; \
	fi

