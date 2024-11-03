install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv --nbval -cov=mylib -cov=main *.ipynb

format:	
	black *.ipynb 

lint: 
	ruff check *.ipynb -v

container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

refactor: format lint

deploy:
	#deploy goes here

all: install lint test format deploy

# generate_and_push:
# 	# Create the markdown file
# 	python script.py

# 	# Add, commit, and push the generated files to GitHub
# 	git config --local user.email "action@github.com"; \
# 	git config --local user.name "GitHub Action"; \
# 	git add .; \
# 	git commit -m "Add generated plots and markdown"; \
# 	git push; \