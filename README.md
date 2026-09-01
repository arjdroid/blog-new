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
content/images/    images referenced by posts and pages
assets/            style.css → copied into dist/ (favicon.svg is generated)
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
  images: ("photo.jpg",),   // optional; see below
  body: [
    Ordinary Typst markup. `=` starts a section (exported as <h2>; <h1> is the
    post title). Equations become MathML, code blocks are highlighted,
    footnotes#footnote[Like this one.] become an endnote list with backlinks.
  ],
)
```

Then register it in `content/posts.typ` — an `#import` line and the module name
in the list. Typst cannot list a directory, so this is the one manual step;
ordering is handled automatically (newest first), as are the sidebar contents,
the previous/next links, and the feed.

Post `title` and `summary` are plain strings, not content, because the Atom feed
reuses them and Typst content cannot be converted back to a string.

Section headings automatically get an `id` and a `¶` permalink anchor, and the
sidebar table of contents is derived from the same headings.

### Citations

Give the post a `bib` field — bytes of Hayagriva YAML, or a path to a `.yml` /
`.bib` file — and cite with `@key` in the body:

```typst
#let bib-data = bytes("
sipser3rd:
  type: book
  title: Introduction to the Theory of Computation
  author: Sipser, Michael
  date: 2013
")

#let post = (
  bib: bib-data,
  // bib-style: "chicago-notes",   // the default
  body: [ According to Sipser @sipser3rd[p.~35], … ],
)
```

With the default `chicago-notes` style each citation becomes a footnote,
numbered in one sequence with the ordinary footnotes, carrying the full
reference. The reference list Typst also emits is therefore redundant and is
hidden by `style.css` — it stays in the markup because the footnotes link into
it, and because `show bibliography: none` breaks with "failed to determine link
anchor". Switch `bib-style` to something like `"ieee"` for inline `[1]`-style
citations; you would then want to unhide `section[role="doc-bibliography"]`.

Two Typst 0.15 quirks worth knowing: anything outside the `post` dictionary in
a post file is discarded (the file is imported, not included), so a bare
`#bibliography(...)` there does nothing; and `#quote(attribution: [@key])`
renders no attribution at all unless the quote is `block: true`.

### Images

Typst's own `#image()` inlines the file as a base64 data URI — a 4 MB photo
becomes a 5.4 MB HTML page that no browser can cache. Use `img()` instead:

1. put the file in `content/images/`,
2. list its filename in the post's (or page's) `images` field,
3. reference it with `#img("photo.jpg", alt: "…", caption: [optional])`.

`src/site.typ` copies each listed file into that page's own output directory, so
the `src` is a bare filename and needs no `../` prefix. `#image()` still works
and is fine for something tiny, but everything real should go through `img()`.

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

Typst emits semantic HTML and no CSS at all, and it generates the
`<html>`/`<head>`/`<body>` skeleton itself. Building that skeleton by hand is
the documented way to control the head, but Typst 0.15 rejects footnotes in
that mode, so `src/template.typ` lets Typst own it: the head gets the charset,
viewport, `<title>` and the metadata passed to `document`, and `style.css` is
linked from the top of the body instead (`stylesheet` is a
[body-ok](https://html.spec.whatwg.org/multipage/links.html) link type, so this
is valid). The `icon` and `alternate` links are not body-ok; Typst offers no way
to reach the head, and browsers honour them anyway.

Typst appends footnotes as a `<section role="doc-endnotes">` at the very end of
the body — after the sidebar and footer. `<body>` is therefore the layout
container, and the stylesheet moves that section back under the article: grid
placement on wide screens, flex `order` on narrow ones.

`assets/style.css` is a reimplementation of Sphinx's
[Alabaster](https://github.com/sphinx-doc/alabaster) theme: a text column of up
to 720px with a 220px sidebar in the left margin, an empty margin of the same
width mirroring it on the right, and Times New Roman at 17px. Every track is
fluid, so the column narrows with the window rather than overflowing it. Below
900px — where the text column would be under ~460px — the
sidebar moves under the article, keeping the page's normal colours, and both it
and the footer are pinned to the bottom of the viewport on short pages. Nothing
depends on Sphinx's `basic.css`.

Most rules are element selectors, since Typst's markup carries no classes of its
own; the classes that do appear (`sidebar`, `related`, `post-card`, `headerlink`,
…) come from `src/template.typ` and `src/post.typ`. Add the class there first,
then style it here.

The webring strip above the copyright line is a placeholder: edit `blogring()`
in `src/template.typ` to point at a real ring, or delete the call from `page()`.

### Favicon

The favicon is drawn by Typst, in `src/site.typ` — `$cal(A)$` on a white
rounded square — and emitted twice: `favicon.svg`, and the same drawing
rasterised to `favicon.ico`. The `.ico` is what actually appears in the tab:
browsers only read `<link rel="icon">` from the `<head>`, which Typst 0.15
cannot reach, but they always request `/favicon.ico` from the site root
regardless. (Its bytes are PNG, which browsers accept for that request.) Note
that this root-request fallback only works when the site is served from a
domain root.

## Deploying

`dist/` is a plain static directory — serve it from any host. For GitHub Pages,
publish the `dist/` output (e.g. via an action running `make build`); the
relative links work from a project subdirectory without configuration.
