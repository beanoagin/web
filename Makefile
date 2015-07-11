all: dependencies quality static serve

clean:
	rm -rf public/css/*.css
	rm -rf public/js/*.js

dependencies:
	npm install

update_po:
	node_modules/.bin/extract-pot --locale locale .
	node_modules/i18n-abide/bin/merge-po.sh locale

compile_json:
	node_modules/i18n-abide/bin/compile-json locale locale

quality:
	gulp lint

js:
	node_modules/.bin/r.js -o build.js optimize=none

css:
	gulp styles

static: clean js css

serve:
	node server.js
