// A static page: exports `body` content and the images it uses. Titles and nav
// come from site.typ. Files listed in `images` live in content/images/ and are
// copied next to this page, so `img()` refers to them by bare filename.

#import "/src/util.typ": img

#let images = ("DSC06483-bnw-dutch-bow.jpg",)

#let body = [
  I write things here occasionally.

  #img("DSC06483-bnw-dutch-bow.jpg", alt: "Black and white photograph")

  This site is built from Typst sources — the whole thing, including this
  sentence, is compiled by `typst compile --format bundle`.

  = Elsewhere

  - Email: #link("mailto:you@example.com")[you\@example.com]
  - Code: #link("https://github.com/")[GitHub]
]
