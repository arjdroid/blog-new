// The landing page. `prefix` is the page's path back to the site root (empty
// here, since the landing page *is* the root); `recent` is the posts to show.

#import "/src/util.typ": site, url
#import "/src/post.typ": post-card

#let body(prefix, recent) = [
  #html.h1(site.title)
  //#html.h1("Arjun's Home Page")
  #html.p(class: "blurb", site.tagline)
  //#html.h2("Hi, I'm Arjun")

  #html.h2("Recent posts")
  #html.ul(class: "post-list", recent.map(p => post-card(prefix, p)).join())
  #html.p(html.a(href: url(prefix, "posts/"), class: "more")[All posts →])
]
