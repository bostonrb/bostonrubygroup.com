RSpec.describe OpenGraphHelper do
  describe "open_graph_tags" do
    it "returns HTML for twitter and open graph meta tags" do
      tags = helper.open_graph_tags

      expect(tags).to match %r{twitter:card}
      expect(tags).to match %r{twitter:creator}
      expect(tags).to match %r{twitter:description}
      expect(tags).to match %r{twitter:image}
      expect(tags).to match %r{twitter:image:alt}
      expect(tags).to match %r{twitter:site}
      expect(tags).to match %r{twitter:title}
      expect(tags).to match %r{twitter:url}

      expect(tags).to match %r{og:description}
      expect(tags).to match %r{og:image}
      expect(tags).to match %r{og:image:alt}
      expect(tags).to match %r{og:site_name}
      expect(tags).to match %r{og:title}
      expect(tags).to match %r{og:type}
      expect(tags).to match %r{og:url}
    end
  end
end
