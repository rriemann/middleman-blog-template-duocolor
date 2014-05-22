activate :dotenv

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
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

helpers do
  def site_url
    '//' + settings.host
  end
end

###
# General settings
###

# Syntax Highlighting
activate :syntax, line_numbers: true

# Assets PATH
set :css_dir,      'stylesheets'
set :js_dir,       'javascripts'
set :images_dir,   'images'
set :build_dir,    'build'
set :partials_dir, 'partials'
set :fonts_dir,    'fonts'

ignore /.*\.kate-swp/
ignore /.*\.new/

# Livereload
# use: https://github.com/middleman/middleman-livereload
activate :livereload

# make /praxis.html appear as /praxis/
activate :directory_indexes
set :trailing_slash, true

set :markdown_engine, :kramdown # now default
set :markdown, :parse_block_html => true

# Slim configuration
set :slim, {
  :format  => :html5,
  :indent => '    ',
  :pretty => true,
  :sort_attrs => false
}
::Slim::Engine.set_default_options lang: I18n.locale, locals: {}

configure :development do
  set :disqus, 'middleman-due-color-testing'
  set :host, 'localhost:4567'
end

# Build-specific configuration
configure :build do
  set :disqus, 'middleman-due-color'
  set :host,   'rriemann.github.io'

  # Enable cache buster
  # activate :asset_hash
  
  # Make favicons
  # use: https://github.com/follmann/middleman-favicon-maker
  activate :favicon_maker, :icons => {
    "favicon_base.png" =>   [
      { icon: "apple-touch-icon-114x114-precomposed.png" },
      { icon: "apple-touch-icon-72x72-precomposed.png" },
      { icon: "apple-touch-icon-57x57-precomposed.png" },
      { icon: "apple-touch-icon-precomposed.png", size: "57x57" },
      { icon: "apple-touch-icon.png", size: "57x57" },
      { icon: "favicon.png", size: "16x16" },
      { icon: "favicon.ico", size: "16x16" },
    ]
  }

  # Minify
  # see: https://github.com/middleman/middleman-guides/blob/master/source/advanced/file-size-optimization.html.markdown#compressing-images
  activate :minify_css
  activate :minify_javascript
  activate :minify_html

  # Enable cache buster
  # see: https://github.com/middleman/middleman-guides/blob/master/source/advanced/improving-cacheability.html.markdown#cache-buster-in-query-string
  activate :cache_buster

  # Use relative URLs
  # activate :relative_assets
  # set :relative_links, true

  # Or use a different image path
  set :http_prefix, '/middleman-blog-template-duocolor/'
end

activate :deploy do |deploy|
  deploy.method = :git
  # Optional Settings
  # deploy.remote   = "custom-remote" # remote name or git url, default: origin
  # deploy.branch   = "custom-branch" # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
end

## custom

# Dir[File.dirname(__FILE__) + '/lib/tags/*.rb'].each {|file| require file }
# require 'lib/tags/image_tag'
# require "lib/custom_helpers"
# helpers CustomHelpers

