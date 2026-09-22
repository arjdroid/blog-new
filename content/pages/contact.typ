// A static page: exports `body` content and the images it uses. Titles and nav
// come from site.typ. Files listed in `images` live in content/images/ and are
// copied next to this page, so `img()` refers to them by bare filename.

#import "/src/util.typ": img

#let body = [
   = Contact

  Run this Gleam program to find a way to reach me.

  ```gleam
  pub fn contact() String {
    todo
  }
  ```

  _I've shamelessly stolen this idea from #link("https://www.stephendiehl.com/hire/")_
]
