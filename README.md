# new-blog

A static blog generated entirely by Typst 0.15. One `typst compile` writes the
whole site: pages come from `#document(...)`, everything else from `#asset(...)`.
No other tooling is involved — no Node, no Python, no static-site framework.

## Commands

```sh
make serve   # rebuild on change + live-reload server on http://localhost:3000
make dev     # one-off build with readable (--pretty) HTML
make build   # minified build into dist/
make check   # build, assert every link is relative, list the output tree
make clean
```

`make serve` uses Typst's own HTTP server: it live-reloads the browser (the
injected script never touches the files on disk) and resolves `/posts/foo/` to
that directory's `index.html`, so local preview matches production.

Both `--features html` and `--features bundle` are still required in 0.15 (the
flags are in the `Makefile`), as is `--root .` so `src/` can read `/assets/*`.

## Layout

```
src/site.typ       entry point — every emitted page and asset is declared here
src/template.typ   the page shell: <html>/<head>/<body>, sidebar, related bars
src/post.typ       post page, listing card, heading anchors, table of contents
src/feed.typ       Atom feed builder
src/util.typ       site config, URL/date/text helpers
content/posts.typ  the post manifest
content/posts/     one file per post
content/pages/     landing page and about page bodies
assets/            style.css, favicon.svg → copied into dist/
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
is handled automatically (newest first), as are the sidebar contents, the
previous/next links, and the feed.

Post `title` and `summary` are plain strings, not content, because the Atom feed
reuses them and Typst content cannot be converted back to a string.

Section headings automatically get an `id` and a `¶` permalink anchor, and the
sidebar table of contents is derived from the same headings.

## URLs are relative, always

Link targets are written **relative to the site root with no leading slash**
(`"posts/"`, `"style.css"`) and passed through `url(prefix, target)` from
`src/util.typ`. Each page's `prefix` is derived from its own output path by
`emit` in `src/template.typ`, so a post two directories deep gets `../../`.

The result relocates: the same `dist/` works at a domain root and inside a
subdirectory (GitHub Pages project sites) with no build-time switch. Typst
already emits cross-document `#link(<label>)` targets as relative paths; this
scheme covers the raw `href`s we write ourselves. `make check` fails the build
if an absolute URL ever creeps back in.

`base-url` in `src/util.typ` is the one exception — `feed.xml` needs absolute
URLs. Set it before publishing.

## Styling

Typst emits semantic HTML and no CSS at all. `src/template.typ` builds the
`<html>`, `<head>` and `<body>` elements itself — which makes Typst skip its own
skeleton — and links `style.css` from the head. Typst still injects its MathML
stylesheet into that head, so equations align correctly.

`assets/style.css` is a reimplementation of Sphinx's
[Alabaster](https://github.com/sphinx-doc/alabaster) theme: a 940px column with
a 220px sidebar on the left, Times New Roman at 17px, and a collapse below
875px that moves the sidebar under the content on a dark background. The layout
uses flexbox rather than Alabaster's float trick, and nothing depends on
Sphinx's `basic.css`.

Most rules are element selectors, since Typst's markup carries no classes of its
own; the classes that do appear (`sidebar`, `related`, `post-card`, `headerlink`,
…) come from `src/template.typ` and `src/post.typ`. Add the class there first,
then style it here.

## Deploying

`dist/` is a plain static directory — serve it from any host. For GitHub Pages,
publish the `dist/` output (e.g. via an action running `make build`); the
relative links work from a project subdirectory without configuration.
