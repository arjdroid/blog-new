// The post manifest.
//
// Typst has no way to list a directory, so every post is registered here.
// To add a post: create the file in posts/, then add an import and an entry
// to the array below. Order does not matter — `all` is sorted newest first.

#import "/src/util.typ": by-date-desc

#import "posts/2026-08-30-hello-world.typ" as hello-world
#import "posts/2026-09-02-typst-as-an-ssg.typ" as typst-as-an-ssg

#let all = by-date-desc((
  hello-world.post,
  typst-as-an-ssg.post,
))
