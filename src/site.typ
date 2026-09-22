// Entry point. Every file the site emits is declared here — pages via `emit`
// (which wraps `document` + the page template), everything else as `asset`s.
//
//   make build    → dist/
//   make serve    → live-reloading preview on :3000

#import "template.typ": emit
#import "post.typ": post-card, post-page
#import "util.typ": post-path, site
#import "feed.typ": atom-feed
#import "/content/posts.typ" as posts
#import "/content/pages/home.typ" as home
#import "/content/pages/about.typ" as about
#import "/content/pages/contact.typ" as contact

#let recent = posts.all.slice(0, calc.min(5, posts.all.len()))

// ── Pages ───────────────────────────────────────────────────────────────────

#emit(
  "index.html",
  title: site.title,
  description: site.tagline,
  current: "home",
  home.body("", recent),
)

#emit(
  "posts/index.html",
  title: "Posts",
  description: "Everything published on " + site.title + ".",
  current: "posts",
)[
  #html.h1("Posts")
  #html.ul(class: "post-list", posts.all.map(p => post-card("../", p)).join())
]

#emit("about/index.html", title: "About", current: "about")[
  #html.h1("About")
  #about.body
]

#emit("contact/index.html", title: "Contact", current: "contact")[
  #html.h1("Contact")
  #contact.body
]

// posts.all is newest first, so the previous entry is the newer post.
#for (i, p) in posts.all.enumerate() {
  post-page(
    p,
    newer: if i > 0 { posts.all.at(i - 1) },
    older: if i + 1 < posts.all.len() { posts.all.at(i + 1) },
  )
}

// ── Generated files ─────────────────────────────────────────────────────────

// The favicon is a Typst document too: the math font's calligraphic A on a
// white rounded square, so it needs no font at render time and no image editor
// to change. Adjust the glyph, colours or radius here.
#let favicon-art = {
  set page(width: 32pt, height: 32pt, margin: 0pt, fill: none)
  set text(fill: black, size: 22pt)
  box(
    width: 100%,
    height: 100%,
    fill: white,
    radius: 6pt,
    align(center + horizon)[$cal(A)$],
  )
}

#document("favicon.svg", favicon-art)

// Browsers only look for <link rel="icon"> in the <head>, which Typst 0.15
// gives no way to reach (see src/template.typ). They do, however, always
// request /favicon.ico from the site root on their own — so the same drawing
// goes out as a raster under that name. The bytes are PNG, which every browser
// accepts for this request.
#document("favicon.ico", format: "png", favicon-art)

// ── Assets ──────────────────────────────────────────────────────────────────

// Images named by a post or page are copied from content/images/ into that
// page's own output directory, so pages can refer to them by bare filename.
#let copy-images(dir, names) = {
  for name in names {
    asset(dir + name, read("/content/images/" + name, encoding: none))
  }
}

#copy-images("about/", about.images)
// #copy-images("contact/", contact.images)
#for p in posts.all {
  copy-images("posts/" + p.slug + "/", p.at("images", default: ()))
}

#asset("style.css", read("/assets/style.css", encoding: none))
#asset("feed.xml", bytes(atom-feed(posts.all)))
#asset("robots.txt", bytes(
  "User-agent: *\nAllow: /\nSitemap: " + site.base-url + "/feed.xml\n",
))
