// Entry point. Every file the site emits is declared here — pages as
// `document`s, everything else as `asset`s.
//
//   make build    → dist/
//   make serve    → live-reloading preview on :3000

#import "template.typ": page
#import "post.typ": post-page, post-card
#import "util.typ": site, post-path
#import "feed.typ": atom-feed
#import "/content/posts.typ" as posts
#import "/content/pages/home.typ" as home
#import "/content/pages/about.typ" as about

// Syntax highlighting is baked into the markup as inline styles, so the theme
// has to be chosen here, at build time. It pairs with the dark <pre> card in
// style.css, which stays dark in both colour schemes for that reason.
#set raw(theme: "/assets/code.tmTheme")

#let recent = posts.all.slice(0, calc.min(5, posts.all.len()))

// ── Pages ───────────────────────────────────────────────────────────────────

#document(
  "index.html",
  title: site.title,
  description: site.tagline,
  page(current: "home", home.body(recent)),
)

#document(
  "posts/index.html",
  title: "Posts",
  description: "Everything published on " + site.title + ".",
  page(title: "Posts", current: "posts")[
    #html.h1("Posts")
    #html.ul(class: "post-list", posts.all.map(post-card).join())
  ],
)

#document(
  "about/index.html",
  title: "About",
  page(title: "About", current: "about")[
    #html.h1("About")
    #about.body
  ],
)

#for p in posts.all {
  document(
    post-path(p),
    title: p.title,
    description: p.summary,
    date: p.date,
    post-page(p),
  )
}

// ── Assets ──────────────────────────────────────────────────────────────────

#asset("style.css", read("/assets/style.css", encoding: none))
#asset("favicon.svg", read("/assets/favicon.svg", encoding: none))
#asset("feed.xml", bytes(atom-feed(posts.all)))
#asset("robots.txt", bytes(
  "User-agent: *\nAllow: /\nSitemap: " + site.base-url + "/feed.xml\n",
))
