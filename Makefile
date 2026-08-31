# HTML and bundle export are both still feature-flagged in Typst 0.15.
# --root . is required so src/ can read /assets/*.
TYPST_FLAGS = --root . --features html,bundle --format bundle

.PHONY: build dev serve clean check

build:
	typst compile $(TYPST_FLAGS) src/site.typ dist

# Same as build, but readable output for inspecting the markup.
dev:
	typst compile $(TYPST_FLAGS) --pretty src/site.typ dist

# Rebuilds on change and serves with live reload on http://localhost:3000.
serve:
	typst watch $(TYPST_FLAGS) --pretty src/site.typ dist --port 3000

check: dev
	@python3 -c "import xml.dom.minidom; xml.dom.minidom.parse('dist/feed.xml')" \
		&& echo "feed.xml: ok"
	@find dist -type f | sort

clean:
	rm -rf dist
