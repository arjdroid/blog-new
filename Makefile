# HTML and bundle export are both still feature-flagged in Typst 0.15.
# --root . is required so src/ can read /assets/*.
TYPST_FLAGS = --root . --features html,bundle --format bundle

.PHONY: build dev serve clean check

build:
	typst compile $(TYPST_FLAGS) src/site.typ dist

# Same as build, but readable output for inspecting the markup.
dev:
	typst compile $(TYPST_FLAGS) --pretty src/site.typ dist

# Typst's own HTTP server: rebuilds on change, live-reloads the browser, and
# resolves /posts/foo/ to that directory's index.html. No other tooling needed.
serve:
	typst watch $(TYPST_FLAGS) --pretty src/site.typ dist --port 3000

# Every link in the output must be relative, or the site breaks when served
# from anywhere but a domain root.
check: dev
	@! grep -rn 'href="/[^/]\|src="/[^/]' dist --include='*.html' \
		|| { echo "absolute URL in output — breaks subdirectory hosting"; exit 1; }
	@echo "links: all relative"
	@command -v xmllint >/dev/null 2>&1 \
		&& xmllint --noout dist/feed.xml && echo "feed.xml: ok" || true
	@find dist -type f | sort

clean:
	rm -rf dist
