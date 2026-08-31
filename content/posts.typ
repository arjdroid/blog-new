// The post manifest.
//
// Typst has no way to list a directory, so every post is registered here.
// To add a post: create the file in posts/, then add an import and the module
// name to the list below. Order does not matter — `all` is sorted newest first.

#import "/src/util.typ": by-date-desc

#import "posts/2026-08-30-hello-world.typ" as hello-world
#import "posts/2026-09-02-typst-as-an-ssg.typ" as typst-as-an-ssg
#import "posts/2026-09-25-proving-automata.typ" as proving-automata

// List the modules themselves; `.post` is unwrapped here so it cannot be
// forgotten at a call site.
#let all = by-date-desc((
  hello-world,
  typst-as-an-ssg,
  proving-automata,
).map(m => m.post))
