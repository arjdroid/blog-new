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

// The outline of a post: one entry per top-level heading, in order, with a
// section number ("2", "2.1", …). The numbers are counted here rather than
// with `counter(heading)` because bundle introspection is global — a shared
// counter would keep climbing from one post to the next.
#let outline-of(body) = {
  let items = if body.has("children") { body.children } else { (body,) }
  let stack = ()
  let out = ()
  for h in items.filter(it => it.func() == heading) {
    // `level` is only resolved during layout; `depth` is what the markup set.
    let depth = h.at("depth", default: 1)
    if stack.len() > depth { stack = stack.slice(0, depth) }
    while stack.len() < depth { stack.push(0) }
    stack.at(depth - 1) += 1
    out.push((
      level: depth,
      text: plain-text(h.body),
      id: heading-id(h),
      number: stack.map(str).join("."),
    ))
  }
  out
}

// id → section number, for the show rule below.
#let numbers-of(outline) = {
  let map = (:)
  for h in outline { map.insert(h.id, h.number) }
  map
}

#let with-anchors(body, numbers: (:)) = {
  show heading: h => {
    let id = heading-id(h)
    let number = numbers.at(id, default: none)
    html.elem(
      "h" + str(calc.min(h.level + 1, 6)),
      attrs: (id: id),
      {
        if number != none { html.span(class: "section-number", number + ".") }
        h.body
        html.a(href: "#" + id, class: "headerlink", title: "Permalink to this section")[¶]
      },
    )
  }
  body
}

// ── Bibliography ────────────────────────────────────────────────────────────
//
// A post's `bib` field (bytes of Hayagriva YAML, or a path to a .yml/.bib
// file) puts its sources on the page. With the default "chicago-notes" style
// each @citation renders as a footnote, sharing one numbering with the
// ordinary footnotes, which is the whole point — so the reference list itself
// is redundant and style.css hides it. It cannot simply be omitted: the
// element has to exist for citations to resolve, and dropping it with
// `show bibliography: none` fails with "failed to determine link anchor",
// since the footnotes link into it.

#let post-bibliography(p) = {
  let data = p.at("bib", default: none)
  if data == none { return }
  bibliography(data, style: p.at("bib-style", default: "chicago-notes"), title: none)
}

// ── Page ────────────────────────────────────────────────────────────────────

#let post-page(p, newer: none, older: none) = {
  // Sections are numbered by default; set `numbered: false` on a post to turn
  // that off for it, in both the headings and the sidebar.
  let numbered = p.at("numbered", default: true)
  let outline = outline-of(p.body)
  if not numbered {
    outline = outline.map(h => (level: h.level, text: h.text, id: h.id))
  }
  let numbers = if numbered { numbers-of(outline) } else { (:) }

  emit(
    "posts/" + p.slug + "/index.html",
    title: p.title,
    description: p.summary,
    date: p.date,
    current: "posts",
    current-slug: p.slug,
    toc: outline,
    related: (newer: newer, older: older),
  )[
    #html.article(class: "post")[
      #html.header(class: "post-header")[
        #html.h1(p.title)
        #html.p(class: "post-meta")[#post-date(p) #post-tags(p)]
      ]
      #with-anchors(p.body, numbers: numbers)
      #post-bibliography(p)
    ]
  ]
}
