---
layout: false
---
# http://www.nicolasgarnil.me/blog/2012/programmatically-creating-a-sitemap-for-your-middleman-website/
root_url = "http://" + data.site.host
xml.instruct!
xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.select { |page| page.path =~ /\.(xml|html|txt)/ }.each do |page|
    xml.url do
      xml.loc "#{root_url}#{page.url}"
      # xml.lastmod Date.today.to_time.iso8601
      xml.lastmod File.mtime(page.source_file).to_time.iso8601
      xml.changefreq page.data.changefreq || "monthly"
      xml.priority page.data.priority || "0.5"
    end
  end
end