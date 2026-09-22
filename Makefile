# HTML and bundle export are both still feature-flagged in Typst 0.15.
# --root . is required so src/ can read /assets/*.
TYPST_FLAGS = --root . --features html,bundle --format bundle

.PHONY: build dev serve clean check deploy

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

# Publishes dist/ to the gh-pages branch via a throwaway worktree, so the
# working tree's checked-out branch (and its dist/ .gitignore) are untouched.
# `git fetch` is allowed to fail: on the first-ever deploy gh-pages doesn't
# exist on the remote yet, so it's created locally as an orphan branch below.
# The local gh-pages branch is force-reset to origin/gh-pages's tip (not
# merged — gh-pages is generated output, so upstream changes like a CNAME
# added via GitHub's UI are best rebuilt on top of, not merged with).
deploy: build
	rm -rf .gh-pages-worktree
	git worktree prune
	git fetch origin gh-pages 2>/dev/null || true
	git worktree add -B gh-pages .gh-pages-worktree origin/gh-pages 2>/dev/null \
		|| git worktree add --orphan -b gh-pages .gh-pages-worktree
	find .gh-pages-worktree -mindepth 1 -maxdepth 1 ! -name .git ! -name CNAME -exec rm -rf {} +
	cp -r dist/. .gh-pages-worktree/
	find .gh-pages-worktree -name .DS_Store -delete
	git -C .gh-pages-worktree add -A
	git -C .gh-pages-worktree commit -m "Deploy $$(date -u +%Y-%m-%dT%H:%M:%SZ)" --allow-empty
	git -C .gh-pages-worktree push -u origin gh-pages
	git worktree remove .gh-pages-worktree --force
