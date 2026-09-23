// The post manifest.
//
// Typst has no way to list a directory, so every post is registered here.
// To add a post: create the file in posts/, then add an import and the module
// name to the list below. Order does not matter — `all` is sorted newest first.

#import "/src/util.typ": by-date-desc

#import "posts/2026-09-21-typst-sitegen.typ" as typst-sitegen
#import "posts/2026-06-12-data-portability.typ" as data-portability
#import "posts/2026-03-21-satan-apple.typ" as satan-apple
#import "posts/2026-02-12-greedy-tragedy.typ" as greedy-tragedy
#import "posts/2025-08-31-linux-desktop.typ" as linux-desktop

// List the modules themselves; `.post` is unwrapped here so it cannot be
// forgotten at a call site.
#let all = by-date-desc((
  typst-sitegen,
  data-portability,
  satan-apple,
  greedy-tragedy,
  linux-desktop,
).map(m => m.post))
