// The site-wide page shell, in the shape of Sphinx's Alabaster theme:
// a 940px column with a 220px sidebar on the left, collapsing below the
// content on narrow screens.
//
// Because we build <html>, <head> and <body> ourselves, Typst omits its own
// skeleton — that is what lets us link the stylesheet and set per-page meta
// tags. Typst still injects its MathML stylesheet into our <head>.

#import "util.typ": (
  fmt-date, nav-links, post-target, prefix-for, site, url,
)
#import "/content/posts.typ" as posts

#let recent-posts = posts.all.slice(0, calc.min(5, posts.all.len()))

// ── Sidebar ─────────────────────────────────────────────────────────────────

#let sidebar-nav(prefix, current) = {
  html.h3("Navigation")
  html.ul(
    nav-links
      .map(l => html.li(
        if l.id == current {
          html.a(href: url(prefix, l.target), class: "current", l.label)
        } else {
          html.a(href: url(prefix, l.target), l.label)
        },
      ))
      .join()
  )
}

// `toc` is a list of (level, text, id) read off the post body.
#let sidebar-toc(toc) = {
  if toc == none or toc.len() == 0 { return }
  html.h3("Contents")
  html.ul(
    class: "toc",
    toc
      .map(h => html.li(
        class: "toc-l" + str(h.level),
        html.a(href: "#" + h.id, h.text),
      ))
      .join(),
  )
}

#let sidebar-recent(prefix, current-slug) = {
  html.h3("Recent posts")
  html.ul(
    class: "recent",
    recent-posts
      .map(p => html.li(
        if p.slug == current-slug {
          html.span(class: "current", p.title)
        } else {
          html.a(href: url(prefix, post-target(p)), p.title)
        },
      ))
      .join(),
  )
}

// ── Related bar (previous / next post) ──────────────────────────────────────

// `related` is (newer: post-or-none, older: post-or-none).
#let related-bar(prefix, related, position) = {
  if related == none { return }
  if related.newer == none and related.older == none { return }
  html.div(class: ("related", position))[
    #html.ul[
      #if related.newer != none {
        html.li(class: "newer")[
          #html.a(href: url(prefix, post-target(related.newer)))[← #related.newer.title]
        ]
      }
      #if related.older != none {
        html.li(class: "older")[
          #html.a(href: url(prefix, post-target(related.older)))[#related.older.title →]
        ]
      }
    ]
  ]
}

// ── Page ────────────────────────────────────────────────────────────────────

#let page(
  prefix: "",
  title: none,
  description: none,
  current: none,
  current-slug: none,
  toc: none,
  related: none,
  body,
) = html.html(lang: "en")[
  #html.head[
    #html.meta(charset: "utf-8")
    #html.meta(name: "viewport", content: "width=device-width, initial-scale=1")
    #html.title(if title == none { site.title } else { title + " · " + site.title })
    #if description != none {
      html.meta(name: "description", content: description)
    }
    #html.meta(name: "author", content: site.author)
    #html.link(rel: "stylesheet", href: url(prefix, "style.css"))
    #html.link(rel: "icon", href: url(prefix, "favicon.svg"))
    #html.link(
      rel: "alternate",
      type: "application/atom+xml",
      title: site.title + " feed",
      href: url(prefix, "feed.xml"),
    )
  ]
  #html.body[
    // The content comes first in the markup so that narrow screens stack the
    // sidebar below the article; `order` puts it back on the left when wide.
    #html.div(class: "document")[
      #html.div(class: "documentwrapper")[
        #html.div(class: "bodycontent")[
          #related-bar(prefix, related, "top")
          #html.main(body)
          #related-bar(prefix, related, "bottom")
        ]
      ]
      #html.div(class: "sidebar")[
        #html.h1(class: "logo", html.a(href: url(prefix, ""), site.title))
        #html.p(class: "blurb", site.tagline)
        #sidebar-nav(prefix, current)
        #sidebar-toc(toc)
        #sidebar-recent(prefix, current-slug)
      ]
    ]
    #html.div(class: "footer")[
      © #site.since #site.author ·
      #html.a(href: url(prefix, "feed.xml"))[Feed] ·
      built with #html.a(href: "https://typst.app")[Typst]
    ]
  ]
]

// Emits one file of the bundle. The `../` prefix is derived from `path` here
// so the two can never drift apart.
#let emit(
  path,
  title: none,
  description: none,
  date: auto,
  current: none,
  current-slug: none,
  toc: none,
  related: none,
  body,
) = document(
  path,
  title: title,
  description: description,
  date: date,
  page(
    prefix: prefix-for(path),
    title: title,
    description: description,
    current: current,
    current-slug: current-slug,
    toc: toc,
    related: related,
    body,
  ),
)
