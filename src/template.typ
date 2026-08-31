// The site-wide page shell.
//
// Because we build <html>, <head> and <body> ourselves, Typst omits its own
// skeleton — that is what lets us link the stylesheet and set per-page meta
// tags. Typst still injects its MathML stylesheet into our <head>.

#import "util.typ": site, nav-links

// An empty `class` array still emits a bare `class` attribute, so the active
// and inactive links are built separately.
#let nav-item(l, current) = html.li(
  if l.id == current {
    html.a(href: l.href, class: "active", l.label)
  } else {
    html.a(href: l.href, l.label)
  },
)

#let nav(current) = html.nav(class: "site-nav")[
  #html.ul(nav-links.map(l => nav-item(l, current)).join())
]

// `title`: page title, or none for the landing page (site title only).
// `description`: used for the <meta name="description"> tag.
// `current`: id of the nav entry to mark active.
#let page(title: none, description: none, current: none, body) = html.html(lang: "en")[
  #html.head[
    #html.meta(charset: "utf-8")
    #html.meta(name: "viewport", content: "width=device-width, initial-scale=1")
    #html.title(if title == none { site.title } else { title + " · " + site.title })
    #if description != none {
      html.meta(name: "description", content: description)
    }
    #html.meta(name: "author", content: site.author)
    #html.link(rel: "stylesheet", href: "/style.css")
    #html.link(rel: "icon", href: "/favicon.svg")
    #html.link(
      rel: "alternate",
      type: "application/atom+xml",
      title: site.title + " feed",
      href: "/feed.xml",
    )
  ]
  #html.body[
    #html.header(class: "site-header")[
      #html.a(href: "/", class: "site-title", site.title)
      #nav(current)
    ]
    #html.main(body)
    #html.footer(class: "site-footer")[
      #html.p[
        © #site.since #site.author ·
        #html.a(href: "/feed.xml")[Feed] ·
        built with #html.a(href: "https://typst.app")[Typst]
      ]
    ]
  ]
]
