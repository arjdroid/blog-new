// Layouts for a single post page and for post entries in a listing.

#import "template.typ": page
#import "util.typ": fmt-date, post-url

// The typed `datetime` attribute takes a real datetime and formats it itself.
#let post-date(p) = html.time(datetime: p.date, fmt-date(p.date))

#let post-tags(p) = if p.tags.len() > 0 {
  html.span(class: "tags", p.tags.map(t => "#" + t).join(" "))
}

// One entry in a post listing (landing page and /posts/).
#let post-card(p) = html.li(class: "post-card")[
  #html.h2(html.a(href: post-url(p), p.title))
  #html.p(class: "post-meta")[#post-date(p) #post-tags(p)]
  #html.p(class: "post-summary", p.summary)
]

// A full post page. Post bodies use `=` for their own sections, which Typst
// exports as <h2> — the <h1> below is the post title.
#let post-page(p) = page(
  title: p.title,
  description: p.summary,
  current: "posts",
)[
  #html.article(class: "post")[
    #html.header(class: "post-header")[
      #html.h1(p.title)
      #html.p(class: "post-meta")[#post-date(p) #post-tags(p)]
    ]
    #p.body
  ]
]
