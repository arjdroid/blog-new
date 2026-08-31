# new-blog

A static blog generated entirely by Typst 0.15. One `typst compile` writes the
whole site: pages come from `#document(...)`, everything else from `#asset(...)`.

## Commands

```sh
make serve   # rebuild on change + live-reload server on http://localhost:3000
make dev     # one-off build with readable (--pretty) HTML
make build   # minified build into dist/
make check   # build, validate feed.xml, list the output tree
make clean
```

Both `--features html` and `--features bundle` are still required in 0.15 (the
flags are in the `Makefile`), as is `--root .` so `src/` can read `/assets/*`.

## Layout

```
src/site.typ       entry point — every emitted page and asset is declared here
src/template.typ   the page shell: <html>/<head>/<body>, nav, footer
src/post.typ       post page layout + the listing card
src/feed.typ       Atom feed builder
src/util.typ       site config (title, base-url, author), URL and date helpers
content/posts.typ  the post manifest
content/posts/     one file per post
content/pages/     landing page and about page bodies
assets/            style.css, favicon.svg, code.tmTheme → copied into dist/
```

## Writing a post

Create `content/posts/YYYY-MM-DD-slug.typ`:

```typst
#let post = (
  slug: "a-new-post",
  title: "A new post",
  date: datetime(year: 2026, month: 9, day: 20),
  tags: ("typst",),
  summary: "One sentence, reused as the meta description and feed summary.",
  body: [
    Ordinary Typst markup. `=` starts a section (exported as <h2>; <h1> is the
    post title). Equations become MathML, code blocks are highlighted.
  ],
)
```

Then register it in `content/posts.typ` — an `#import` line and an entry in the
array. Typst cannot list a directory, so this is the one manual step; ordering
is handled automatically (newest first).

Post `title` and `summary` are plain strings, not content, because the Atom feed
reuses them and Typst content cannot be converted back to a string.

## How the styling works

Typst emits semantic HTML and no CSS at all. `src/template.typ` builds the
`<html>`, `<head>` and `<body>` elements itself — which makes Typst skip its own
skeleton — and links `/style.css` from the head. Typst still injects its MathML
stylesheet into that head, so equations align correctly.

`assets/style.css` is therefore mostly element selectors, plus the classes the
templates attach (`site-header`, `post-card`, `post-meta`, …). Add a class in
`src/*.typ` first, then style it.

Syntax highlighting is the exception: Typst bakes it into the markup as inline
`style` attributes at build time, so it cannot follow the browser's colour
scheme. `assets/code.tmTheme` sets those colours and `<pre>` stays on a dark
card in both light and dark mode to match.

## Deploying

`dist/` is a plain static directory with root-relative links — serve it from any
host. Set `base-url` in `src/util.typ` before publishing; the feed uses it to
build absolute URLs.
