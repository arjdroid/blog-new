// A static page: exports `body` content. Titles and nav come from site.typ.

#let body = [
  I write things here occasionally.

  This site is built from Typst sources — the whole thing, including this
  sentence, is compiled by `typst compile --format bundle`.

  = Elsewhere

  - Email: #link("mailto:you@example.com")[you\@example.com]
  - Code: #link("https://github.com/")[GitHub]
]
