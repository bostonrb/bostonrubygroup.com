module OpenGraphHelper
  IMAGE_NAME = "og_meta_image.jpg".freeze

  def open_graph_tags
    twitter_meta_tags + open_graph_meta_tags
  end

  private

  def twitter_meta_tags
    raw [
      meta_tag(name: "twitter:card", content: "summary"),
      meta_tag(name: "twitter:creator", content: "@bostonrb"),
      meta_tag(name: "twitter:description", content: description),
      meta_tag(name: "twitter:image", content: image_url(IMAGE_NAME)),
      meta_tag(name: "twitter:image:alt", content: image_alt_text),
      meta_tag(name: "twitter:site", content: "@bostonrb"),
      meta_tag(name: "twitter:title", content: "Boston Ruby Group"),
      meta_tag(name: "twitter:url", content: root_url)
    ].join("\n")
  end

  def open_graph_meta_tags
    raw [
      meta_tag(property: "og:description", content: description),
      meta_tag(property: "og:image", content: image_url(IMAGE_NAME)),
      meta_tag(property: "og:image:alt", content: image_alt_text),
      meta_tag(property: "og:site_name", content: "BostonRB"),
      meta_tag(property: "og:title", content: "Boston Ruby Group"),
      meta_tag(property: "og:type", content: "website"),
      meta_tag(property: "og:url", content: root_url)
    ].join("\n")
  end

  def meta_tag(options)
    tag("meta", options)
  end

  def image_url(filename)
    URI.join(root_url, image_path(filename))
  end

  def description
    I18n.t("meta_tags.description")
  end

  def image_alt_text
    I18n.t("meta_tags.image_alt_text")
  end
end
