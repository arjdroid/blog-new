// The site-wide page shell, in the shape of Sphinx's Alabaster theme:
// a 940px column with a 220px sidebar on the left, collapsing below the
// content on narrow screens.
//
// Typst generates <html>, <head> and <body> itself here. We used to build them
// by hand — which is the documented way to control the head — but Typst 0.15
// rejects footnotes in that mode ("footnotes are not currently supported in
// combination with a custom `<html>` or `<body>` element"), and footnotes are
// worth more than head control. In exchange Typst fills the head with the
// charset, viewport, <title> and the metadata passed to `document`, and it
// appends footnotes as a <section role="doc-endnotes"> at the very end of the
// body — after our footer. The layout in style.css reorders it back into place.

#import "util.typ": (
  fmt-date, nav-links, post-target, prefix-for, site, url,
)
#import "/content/posts.typ" as posts

#let recent-posts = posts.all.slice(0, calc.min(5, posts.all.len()))

// ── Head-ish elements ───────────────────────────────────────────────────────

#let page-links(prefix) = {
  // `stylesheet` is a body-ok link type, so this is valid where it lands.
  html.link(rel: "stylesheet", href: url(prefix, "style.css"))
  // These two are not body-ok, and browsers do not look for them outside the
  // <head>, which Typst gives no way to reach. They are kept as a best effort
  // for tools that scan the whole document (many feed readers do). What
  // actually puts the icon in the tab is /favicon.ico, which browsers request
  // from the site root on their own — site.typ emits it.
  html.link(rel: "icon", href: url(prefix, "favicon.svg"))
  html.link(
    rel: "alternate",
    type: "application/atom+xml",
    title: site.title + " feed",
    href: url(prefix, "feed.xml"),
  )
}

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

// `toc` is a list of (level, text, id) read off the post body, each with an
// optional `number` when the post's sections are numbered.
#let sidebar-toc(toc) = {
  if toc == none or toc.len() == 0 { return }
  html.h3("Contents")
  html.ul(
    class: "toc",
    toc
      .map(h => html.li(
        class: "toc-l" + str(h.level),
        html.a(
          href: "#" + h.id,
          {
            if "number" in h { html.span(class: "section-number", h.number + ".") }
            h.text
          },
        ),
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

// ── Blogring ────────────────────────────────────────────────────────────────

// Placeholder. Swap the `#` hrefs for the ring's real URLs (and the ring name
// for its real name) once you have joined one.
#let blogring() = html.div(class: "blogring")[
  //#html.span(class: "ring-name")[gathering]
  #html.a(href: "https://kytrinh.me/gathering/arjdroid.me/prev")[← prev]
  #html.a(href: "https://kytrinh.me/gathering/")[gathering]
  #html.a(href: "https://kytrinh.me/gathering/arjdroid.me/next")[next →]
]

// ── Page ────────────────────────────────────────────────────────────────────

#let page(
  prefix: "",
  current: none,
  current-slug: none,
  toc: none,
  related: none,
  body,
) = {
  page-links(prefix)

  html.div(class: "documentwrapper")[
    #html.div(class: "bodycontent")[
      #related-bar(prefix, related, "top")
      #html.main(body)
      #related-bar(prefix, related, "bottom")
    ]
  ]

  html.div(class: "sidebar")[
    #html.h1(class: "logo", html.a(href: url(prefix, ""), site.title))
    #html.p(class: "blurb", site.tagline)
    #sidebar-nav(prefix, current)
    #sidebar-toc(toc)
    #sidebar-recent(prefix, current-slug)
  ]

  html.div(class: "pagefooter")[
    #blogring()
    #html.div(class: "footer")[
      © #site.since #site.author ·
      #html.a(href: url(prefix, "feed.xml"))[Feed] ·
      built with #html.a(href: "https://typst.app")[Typst]
    ]
  ]
}

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
  title: if title == none { site.title } else { title + " · " + site.title },
  description: description,
  author: site.author,
  date: date,
  page(
    prefix: prefix-for(path),
    current: current,
    current-slug: current-slug,
    toc: toc,
    related: related,
    body,
  ),
)
