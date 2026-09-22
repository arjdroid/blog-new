// The landing page. `prefix` is the page's path back to the site root (empty
// here, since the landing page *is* the root); `recent` is the posts to show.

#import "/src/util.typ": img
#import "/src/util.typ": site, url
#import "/src/post.typ": post-card

#let images = ("DSC06483-bnw-dutch-bow.jpg",)

#let body(prefix, recent) = [
  //#html.h1(site.title)
  //#html.h1("Home")
  //#html.p(class: "blurb", site.tagline)
  #html.h1("Hi, I'm Arjun")
  //#html.h2("Recent posts")
  //#html.ul(class: "post-list", recent.map(p => post-card(prefix, p)).join())
  //#html.p(html.a(href: url(prefix, "posts/"), class: "more")[All posts →])

  I am currently an undergraduate studying Computer Science and Philosophy at the University of California, San Diego.

  //`Currently an undergraduate studying Computer Science and Philosophy at the University of California`

/*  ```txt
  Currently an undergraduate studying Computer Science and Philosophy at the University of California

  Currently an undergraduate studying Computer Science and Philosophy at UCSD
  ```
*/
  I have many interests, and I try to enjoy a lot of the good things life has to offer -- like coffee, and pleasant company.

  I am optimistic about humans and technology; I think we can do great feats for great good, and that it is a worthwhile, albeit not easy pursuit.

  I write here occasionally. I also like taking photos! Here's one I took near the Bay Bridge in San Francisco:

  #img("DSC06483-bnw-dutch-bow.jpg", alt: "Black and white photograph of a large bow")

  //This site is built from Typst sources — the whole thing, including this  sentence, is compiled by `typst compile --format bundle`.

  = Fun Projects

  #link("https://typcraft.nxtdroid.win")[typcraft]

  = Find me

  // - Email: #link("mailto:you@example.com")[you\@example.com]
  //- Code: #link("https://github.com/")[GitHub]

  #link("https://github.com/")[GitHub]

  #link("https://lobste.rs/~arjdroid")[Lobsters]

  
]
