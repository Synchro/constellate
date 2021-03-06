install:
	pipenv install --dev
	npm install

serve: front_end_bundle
	cd backend && \
	pipenv run python ./manage.py runserver

clean_vue_static:
	rm -rf ./static-vue/
	rm -rf ./backend/static-vue/
	rm -rf ./backend/staticfiles

front_end_bundle: clean_vue_static
	npm run build && \
	cp ./static-vue/index.html ./backend/backend/templates/pages/vue.html && \
	cp -R ./static-vue/ ./backend/static-vue/

dev.frontend:
	npm run serve

dev.backend:
	cd backend && \
	pipenv run python ./manage.py runserver

test.frontend:
	npm run test:unit

test.backend:
	cd backend && \
	pytest
