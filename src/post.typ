// Layouts for a single post page and for post entries in a listing.

#import "template.typ": emit
#import "util.typ": fmt-date, plain-text, post-target, slug, url

// The typed `datetime` attribute takes a real datetime and formats it itself.
#let post-date(p) = html.time(datetime: p.date, fmt-date(p.date))

#let post-tags(p) = if p.tags.len() > 0 {
  html.span(class: "tags", p.tags.map(t => "#" + t).join(" "))
}

// One entry in a post listing (landing page and /posts/).
#let post-card(prefix, p) = html.li(class: "post-card")[
  #html.h2(html.a(href: url(prefix, post-target(p)), p.title))
  #html.p(class: "post-meta")[#post-date(p) #post-tags(p)]
  #html.p(class: "post-summary", p.summary)
]

// ── Headings ────────────────────────────────────────────────────────────────
//
// Post bodies use `=` for their own sections; the post title is the page's
// <h1>, so a level-1 heading becomes <h2>. Each heading gets an id derived
// from its text plus an Alabaster-style ¶ anchor, and the sidebar table of
// contents is built from the same text so the two always agree.

#let heading-id(h) = slug(plain-text(h.body))

#let with-anchors(body) = {
  show heading: h => {
    let id = heading-id(h)
    html.elem(
      "h" + str(calc.min(h.level + 1, 6)),
      attrs: (id: id),
      {
        h.body
        html.a(href: "#" + id, class: "headerlink", title: "Permalink to this section")[¶]
      },
    )
  }
  body
}

#let toc-of(body) = {
  let items = if body.has("children") { body.children } else { (body,) }
  items
    .filter(it => it.func() == heading)
    // `level` is only resolved during layout; `depth` is what the markup set.
    .map(h => (
      level: h.at("depth", default: 1),
      text: plain-text(h.body),
      id: heading-id(h),
    ))
}

// ── Page ────────────────────────────────────────────────────────────────────

#let post-page(p, newer: none, older: none) = emit(
  "posts/" + p.slug + "/index.html",
  title: p.title,
  description: p.summary,
  date: p.date,
  current: "posts",
  current-slug: p.slug,
  toc: toc-of(p.body),
  related: (newer: newer, older: older),
)[
  #html.article(class: "post")[
    #html.header(class: "post-header")[
      #html.h1(p.title)
      #html.p(class: "post-meta")[#post-date(p) #post-tags(p)]
    ]
    #with-anchors(p.body)
  ]
]
