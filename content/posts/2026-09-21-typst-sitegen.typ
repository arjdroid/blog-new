//#import "/src/util.typ": img

#let post = (
  slug: "typst-sitegen",
  title: "Static Site Generation with Typst",
  date: datetime(year: 2026, month: 9, day: 21),
  tags: ("programming", "typst"),
  summary: "They said it couldn't be done",
  //images: ("procrastination.jpg",),
  body: [
//#img("procrastination.jpg", alt: "Laptop in restaurant")

It is no secret that I love #link("https://typst.app")[Typst]. I've had a blog website for over half a decade now (wow, time sure flies), and I've been meaning to write more and more in Typst. For the longest time, #link("https://arjdroid.me") has been generated with `hugo` and that uses good ol' Markdown for individual blog posts. Don't get me wrong, Markdown is great, and I love it for Obsidian, but I crave more features, as well as a nice standardised syntax, and CommonMark just isn't it.

Really, I was initially motivated by the prospect of being able to put out footnotes, and more mathematical-notation-intensive stuff on the web, like my paper on the decision theoretic paradox of Satan's Apple #footnote()[#link("/posts/satan-apple")].

Still, typsetting academic papers and coursework is one thing, but a website might seem like its pushing it a little, no? I think if we were talking about LaTeX, then sure, but cmon now, this is Typst! It's basically a full-fledged (functional) programming language that happens to just compile to PDF's, SVG's, and now HTML#footnote()[Semantic MathML support and bundle exports as of `typst 0.15.1`]!

To put a long story short, I messed around with Claude Code and got a pretty neat, workable static site generation workflow completely in Typst. I can make new posts rather easily, and I feel at home using Typst instead of Markdown in #link("https://helix-editor.com/")[Helix]. To commemorate the new beginnings of my blogging adventures, I also moved to this new domain that is hopefully easier for people to pronounce.

Overall, I found it much nicer than Hugo as its a lot more flexible and I know its ins and outs. The styling is taken care of by one giant CSS file, but other than that its all Typst -- including the templates which do include some `html.elem`'s here and there but I try to avoid it if I can.

I really like that the programming and the typesetting and the content are all in the same language. I even made the favicon in Typst! Here's an excerpt from `src/site.typ` to give you an idea of the flexibility of Typst:
```typc
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
```

One caveat: Typst warns against using the HTML capabilities for production since they're still moving fast and breaking things. I look forward to seeing how this goes.

TODO: add a more detailed breakdown of architectural decisions, though this is highly volatile and subject to change so I'm refraining for now. 
]
)
