// Atom feed, built as a plain string and shipped via #asset.
//
// Entries carry titles, summaries and links rather than full bodies: post
// bodies are Typst content, and content cannot be converted back to a string.

#import "util.typ": site, post-target, rfc3339, xml-escape

#let entry(p) = {
  // The feed is the one place that needs absolute URLs.
  let url = site.base-url + "/" + post-target(p)
  "  <entry>\n"
  "    <title>" + xml-escape(p.title) + "</title>\n"
  "    <link href=\"" + url + "\"/>\n"
  "    <id>" + url + "</id>\n"
  "    <updated>" + rfc3339(p.date) + "</updated>\n"
  "    <summary>" + xml-escape(p.summary) + "</summary>\n"
  "  </entry>\n"
}

#let atom-feed(posts) = {
  let updated = if posts.len() > 0 { rfc3339(posts.first().date) } else { rfc3339(datetime.today()) }
  "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
  "<feed xmlns=\"http://www.w3.org/2005/Atom\">\n"
  "  <title>" + xml-escape(site.title) + "</title>\n"
  "  <subtitle>" + xml-escape(site.tagline) + "</subtitle>\n"
  "  <link href=\"" + site.base-url + "/feed.xml\" rel=\"self\"/>\n"
  "  <link href=\"" + site.base-url + "/\"/>\n"
  "  <id>" + site.base-url + "/</id>\n"
  "  <author><name>" + xml-escape(site.author) + "</name></author>\n"
  "  <updated>" + updated + "</updated>\n"
  posts.map(entry).join()
  "</feed>\n"
}
