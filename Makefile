HUGO := $(HOME)/.local/bin/hugo

.PHONY: serve build clean

# Start local dev server with live reload
serve:
	$(HUGO) server --buildDrafts --bind 0.0.0.0 --port 1313

# Build the site into ./public/
build:
	$(HUGO) --minify

# Remove generated output
clean:
	rm -rf public
