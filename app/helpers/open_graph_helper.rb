module OpenGraphHelper
  def open_graph_tags
    twitter_meta_tags + open_graph_meta_tags
  end

  private

  def twitter_meta_tags
    raw [
      meta_tag(name: "twitter:card", content: "summary"),
      meta_tag(name: "twitter:url", content: url_for(only_path: false)),
      meta_tag(name: "twitter:site", content: "@bostonrb"),
      meta_tag(name: "twitter:creator", content: "@bostonrb"),
      meta_tag(name: "twitter:title", content: "BostonRB"),
      meta_tag(name: "twitter:image", content: image_url("og_meta_image.jpg")),
      meta_tag(name: "twitter:site", content: "@bostonrb"),
      meta_tag(
        name: "twitter:description",
        content: "Boston Ruby Group helps you make connections, hack on projects, learn new things, and have fun with other Ruby enthusiasts."
      ),
      meta_tag(
        name: "twitter:image_alt",
        content: "Photograph of attendees at a Boston RB event"
      )
    ].join("\n")
  end

  def open_graph_meta_tags
    raw [
      meta_tag(property: "og:image", content: image_url("og_meta_image.jpg")),
      meta_tag(property: "og:url", content: url_for(only_path: false)),
      meta_tag(property: "og:title", content: "BostonRB"),
      meta_tag(property: "og:author", content: "Boston Ruby Group"),
      meta_tag(name: "author", content: "Boston Ruby Group"),
      meta_tag(property: "og:city", content: "Boston"),
      meta_tag(property: "og:state", content: "MA"),
      meta_tag(property: "og:country", content: "US"),
      meta_tag(property: "og:type", content: "website"),
      meta_tag(property: "og:url", content: "https://bostonrb.org"),
      meta_tag(property: "og:site_name", content: "bostonrb.org"),
      meta_tag(
        property: "og:description",
        content: "Boston Ruby Group helps you make connections, hack on projects, learn new things, and have fun with other Ruby enthusiasts."
      ),
      meta_tag(
        name: "description",
        content: "Boston Ruby Group helps you make connections, hack on projects, learn new things, and have fun with other Ruby enthusiasts."
      )
    ].join("\n")
  end

  def meta_tag(options)
    tag("meta", options)
  end

  def image_url(filename)
    URI.join(root_url, image_path(filename))
  end
end
