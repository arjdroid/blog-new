// Site-wide configuration and small helpers.
// Everything here is plain data — no HTML, no layout.

#let site = (
  title: "New Blog",
  tagline: "Notes on software, typesetting, and whatever else is on my mind.",
  base-url: "https://example.com",
  author: "Your Name",
  // Shown in the footer.
  since: 2026,
)

#let nav-links = (
  (id: "home", label: "Home", href: "/"),
  (id: "posts", label: "Posts", href: "/posts/"),
  (id: "about", label: "About", href: "/about/"),
)

// URL a post is served at, and the path it is written to in the bundle.
#let post-url(p) = "/posts/" + p.slug + "/"
#let post-path(p) = "posts/" + p.slug + "/index.html"

// "August 30, 2026" for humans; RFC 3339 for <time> and the Atom feed.
#let fmt-date(d) = d.display("[month repr:long] [day padding:none], [year]")
#let rfc3339(d) = d.display("[year]-[month]-[day]") + "T00:00:00Z"

// Sort key: posts are ordered newest first everywhere.
#let by-date-desc(items) = items.sorted(key: p => p.date.display("[year][month][day]")).rev()

#let xml-escape(s) = s
  .replace("&", "&amp;")
  .replace("<", "&lt;")
  .replace(">", "&gt;")
