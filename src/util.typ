// Site-wide configuration and small helpers.
// Everything here is plain data — no HTML, no layout.

#let site = (
  title: "Arjun's Blog",
  tagline: "Miscellaneous Musings",
  author: "Arjun Singh",
  // Only used to build absolute URLs in feed.xml. Everything the pages
  // themselves link to is relative, so this is the one place a wrong value
  // matters. Set it before publishing.
  base-url: "https://arjuns.blog",
  since: 2026,
)

// ── URLs ────────────────────────────────────────────────────────────────────
//
// Every link target in this project is written relative to the site root and
// *without* a leading slash ("posts/", "style.css", …). Each page then turns
// those into paths relative to itself, so the built site can be served from a
// domain root, a subdirectory, or opened straight off disk.

// "posts/hello/index.html" → "../../";  "index.html" → ""
#let prefix-for(path) = "../" * (path.split("/").len() - 1)

#let url(prefix, target) = if target == "" and prefix == "" { "./" } else { prefix + target }

#let post-target(p) = "posts/" + p.slug + "/"
#let post-path(p) = "posts/" + p.slug + "/index.html"

#let nav-links = (
  (id: "home", label: "Home", target: ""),
  (id: "posts", label: "Posts", target: "posts/"),
  (id: "about", label: "About", target: "about/"),
  (id: "contact", label: "Contact", target: "contact/"),
)

// ── Images ──────────────────────────────────────────────────────────────────
//
// Typst's own `#image()` inlines the file as a base64 data URI, which turns a
// 4 MB photo into a 5.4 MB HTML page that no browser can cache. Instead, put
// the file in content/images/, list its name in the post's or page's `images`
// field, and reference it with `img()`. site.typ copies it next to the page
// that uses it, so the `src` is a bare filename and needs no `../` prefix.

#let img(file, alt: "", caption: none) = {
  let el = html.img(src: file, alt: alt)
  if caption == none { el } else { html.figure[#el #html.figcaption(caption)] }
}

// ── Dates ───────────────────────────────────────────────────────────────────

#let fmt-date(d) = d.display("[month repr:long] [day padding:none], [year]")
#let rfc3339(d) = d.display("[year]-[month]-[day]") + "T00:00:00Z"

// Posts are newest first everywhere on the site.
#let by-date-desc(items) = items.sorted(key: p => p.date.display("[year][month][day]")).rev()

// ── Content → text ──────────────────────────────────────────────────────────
//
// Typst has no built-in way to turn content back into a string, which heading
// ids and the sidebar table of contents both need.

#let plain-text(it) = {
  if it == none {
    ""
  } else if type(it) == str {
    it
  } else if type(it) != content {
    str(it)
  } else if it.has("text") {
    it.text
  } else if it.has("children") {
    it.children.map(plain-text).join("")
  } else if it.has("body") {
    plain-text(it.body)
  } else if it.func() == smartquote {
    if it.double { "\"" } else { "'" }
  } else {
    " "
  }
}

#let slug(s) = {
  let out = lower(s).replace(regex("[^a-z0-9]+"), "-")
  while out.starts-with("-") { out = out.slice(1) }
  while out.ends-with("-") { out = out.slice(0, -1) }
  if out == "" { "section" } else { out }
}

#let xml-escape(s) = s
  .replace("&", "&amp;")
  .replace("<", "&lt;")
  .replace(">", "&gt;")
