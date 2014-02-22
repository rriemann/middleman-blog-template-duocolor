---
layout: false
---
@articles ||= blog.articles[0..10]
xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = "http://#{data.site.host}/"
  xml.title @tagname.nil? ? data.site.title : "#{data.site.title} – #{@tagname}"
  xml.subtitle @tagname.nil? ? data.site.subtitle : "posts tagged with #{@tagname}"
  xml.id URI.join(site_url, blog.options.prefix.to_s)
  xml.link "href" => URI.join(site_url, blog.options.prefix.to_s)
  xml.link "href" => URI.join(site_url, current_page.path), "rel" => "self"
  xml.updated @articles.first.date.to_time.iso8601
  xml.author do
    xml.name data.site.author
    xml.email data.site.email
  end

  @articles.each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => URI.join(site_url, article.url)
      xml.id URI.join(site_url, article.url)
      # xml.published article.date.to_time.iso8601
      # xml.updated File.mtime(article.source_file).iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "Article Author" }
      # xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end