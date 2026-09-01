// A static page: exports `body` content and the images it uses. Titles and nav
// come from site.typ. Files listed in `images` live in content/images/ and are
// copied next to this page, so `img()` refers to them by bare filename.

#import "/src/util.typ": img

#let images = ("DSC06483-bnw-dutch-bow.jpg",)

#let body = [
  Hi, I'm Arjun.

  I am currently an undergraduate studying Computer Science and Philosophy at the University of California, San Diego.

  `Currently an undergraduate studying Computer Science and Philosophy at the University of California`

  ```txt
  Currently an undergraduate studying Computer Science and Philosophy at the University of California

  Currently an undergraduate studying Computer Science and Philosophy at UCSD
  ```

  I have a lot of interests, and I try to enjoy a lot of the good things life has to offer.

  I am optimistic about humans and technology – I think we can do great feats for great good, and that it is a worthwhile pursuit, albeit not easy.

  I write things here occasionally.

  #img("DSC06483-bnw-dutch-bow.jpg", alt: "Black and white photograph")

  //This site is built from Typst sources — the whole thing, including this  sentence, is compiled by `typst compile --format bundle`.

  = Elsewhere

  // - Email: #link("mailto:you@example.com")[you\@example.com]
  //- Code: #link("https://github.com/")[GitHub]

  #link("https://github.com/")[GitHub]

  = Fun Projects

  #link("https://typcraft.nxtdroid.win")[typcraft]
]
