
require 'rgbapng'

###
# Blog settings
###

Time.zone = "Paris" # default : UTC

activate :blog do |blog|
  # blog.prefix = "blog"
  # blog.permalink = ":year/:month/:day/:title.html"
  # blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "post"
  blog.summary_separator = /<!--\s?more\s?-->/
  blog.summary_length = BigDecimal::INFINITY
  # blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  blog.default_extension = ".md"
  blog.sources = "posts/:year-:month-:day-:title.html"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end

ready do
  # Add bower's directory to sprockets asset path
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
  
  blog.tags.each do |tag, articles|
    page "/tags/#{tag}/atom.xml", proxy: "/atom.xml", layout: false do
      @tagname = tag
      @articles = articles[0..10]
    end
  end
end

###
# Localization settings
###

activate :i18n, :mount_at_root => :en

###
# General settings
###

# Syntax Highlighting
activate :syntax, line_numbers: true

activate :relative_assets
set :relative_links, true

# Assets PATH
set :css_dir,      'stylesheets'
set :js_dir,       'javascripts'
set :images_dir,   'images'
set :build_dir,    'build'
set :partials_dir, 'partials'
set :fonts_dir,    'fonts'

# Livereload
# use: https://github.com/middleman/middleman-livereload
activate :livereload

# make /praxis.html appear as /praxis/
activate :directory_indexes
set :trailing_slash, true

set :markdown_engine, :kramdown # now default
set :markdown, :parse_block_html => true

helpers do
  def site_url
    '//' + settings.host + '/middleman-blog-template-duocolor'
  end
end

activate :deploy do |deploy|
  deploy.method = :git
  # Optional Settings
  # deploy.remote   = "custom-remote" # remote name or git url, default: origin
  # deploy.branch   = "custom-branch" # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
end

configure :development do
  set :disqus, 'testing'
  set :host, 'localhost:4567'
end

# Build-specific configuration
configure :build do
  set :disqus, 'production'
  set :host,   'rriemann.github.io'
end
