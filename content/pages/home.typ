// The landing page. Takes the posts to feature so the page owns its own copy.

#import "/src/util.typ": site
#import "/src/post.typ": post-card

#let body(recent) = [
  #html.section(class: "intro")[
    #html.h1(site.title)
    #html.p(class: "tagline", site.tagline)
  ]

  #html.section(class: "recent")[
    #html.h2("Recent posts")
    #html.ul(class: "post-list", recent.map(post-card).join())
    #html.p(html.a(href: "/posts/", class: "more")[All posts →])
  ]
]
