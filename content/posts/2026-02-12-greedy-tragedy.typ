#import "/src/util.typ": img

#let bib-data = bytes("
  hedden_options_2015:
    type: article
    title: Options and {Diachronic} {Tragedy}
    author: Hedden, Brian
    date: 2015-03
    page-range: 423-451
    url:
      value: https://onlinelibrary.wiley.com/doi/10.1111/phpr.12048
      date: 2026-02-12
    serial-number:
      doi: 10.1111/phpr.12048
      issn: 0031-8205, 1933-1592
    parent:
      type: periodical
      title: Philosophy and Phenomenological Research
      issue: 2
      volume: 90
")

#let post = (
  slug: "greedy-tragedy",
  bib: bib-data,
  title: "Greedy Algorithms and Diachronic Tragedy",
  date: datetime(year: 2026, month: 2, day: 12),
  tags: ("programming", "philosophy"),
  summary: "My daemons might not be irrational after all!",
  images: ("procrastination.jpg",),
  body: [
#img("procrastination.jpg", alt: "Procrastination")

This is going to be a short one but I figure I still want to push _something_ into the aether every month; it's good practice for getting more comfortable writing publicly and without excessive indecision.

Right now, in my algorithms class, we just finished covering greedy algorithms, and one quote from lecture that stuck with me was something along the lines of, "Just like in real life, choosing the best option in the moment may not be the optimal strategy for the long-term".

At the same time, in one of my philosophy courses we're reading about what Brian Hedden dubs 'The Diachronic Tragedy' - the undesirable outcome that occurs when one's preferences lead them to make choices desirable in individual instances (synchronically), but are undesirable in the bigger picture through time (diachronically). The over-arching example goes something like this:

Suppose you have two choices: up, and down, at two times: t1, and t2. At individual instances t1 and t2 you always prefer going up to going down, no matter what you decide(d) to do before / after.
However, overall, you would actually prefer down, down over up, up (for a wide variety of reasons that can be applicable across different cases, this is just a simplification of the idea). So, your making desirable choices at individual instances lead to an undesirable sequence of choices across those instances combined.
@hedden_options_2015[p.~429]

Hedden argues that holding beliefs that lead to a diachronic tragedy are not irrational inherently due to that property. I find this interesting in the case of greedy algorithms because in our problems we have clearly defined objectives that our solution should be optimal for. Thus, we can make exchange arguments or present counter-examples as to why a greedy solution (which may involve a set of actions that would be considered as leading to diachronic tragedy) is or isn't optimal.

I think a lot of my own actions may be considered preferrable in the moment, but undesirable across time, according to my own beliefs. From the perspective of my algorithms class, they would be considered similar to a non-optimal greedy strategy. However, from the philosophical question of rationality, it is up for debate? I don't know, but I do have a lot homework due so that's all for now.
]
)
