###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
 activate :livereload
end

# Methods defined in the helpers block are available in templates
helpers do
  def x_link_to(link_text, url, options = {})
    options[:class] ||= ""
    if url == '/' + current_page.path
      options[:class] << " current"
      '<span class="current-a">' + link_text + '</span>'
    else
      link_to(link_text, url, options)
    end
  end

  def nav_link(link_text, url, options = {})
    options[:class] ||= ""
    
    option = /^\/option(\d)/.match('/' + current_page.path)
    if option
      url = '/option' + option[1] + url
    end

    is_home = /^#{url}$/.match('/' + current_page.path) and /^(\/option\d)?\/index.html$/.match(url)
    section = /(\/option\d)?\/([^\.\/]*)/.match('/' + current_page.path)
    in_section = /\/#{section[2]}\//.match(url)
    if in_section or is_home
      options[:class] << ' in_section'
    end

    if /^#{url}$/.match('/' + current_page.path)
      options[:class] << ' current'
      '<span class="' + options[:class] + '"><span class="visuallyhidden">Current: </span>' + link_text + '</span>'
    else
      link_to(link_text, url, options)
    end
  end
  
  def block_start(block_name = "")
    '<div class="' + block_name + '">'
  end
  def block_end
    '</div>'
  end

  def article_start(article_id = "")
    '<article id="' + article_id + '">'
  end
  def article_end
    '</article>'
  end
  
  def find_out_more(url)
    '<p><a href="' + url + '">Find out more<span class="nodecoration"> ►</span></a></p>'
  end
end

set :markdown_engine, :kramdown
activate :autoprefixer, browsers: ['last 2 versions', 'ie 8', 'ie 9']

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'img'

set :relative_links, true
activate :relative_assets

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :deploy do |deploy|
  deploy.method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch   = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end