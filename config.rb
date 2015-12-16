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

##
# Define site-wide variables and make them visible for templates
##
@site = {
  'title'         => 'Planning and Managing Web Accessibility',
  'github'        => 'wai-dynamic-planning',
  'email'         => 'wai-eo-editors@w3.org',
  'email-private' => 'wai@w3.org'
}
set :site, @site

###
# Helpers
###

# Reload the browser automatically whenever files change
configure :development do
 activate :livereload
end

# Methods defined in the helpers block are available in templates
helpers do
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

  def w3url(uri)
    if development? || ENV['BUILD_FOR_GITHUB']
      'https://www.w3.org' + uri.to_s
    else
      uri
    end
  end

  def in_section?(section)
    current_page.path.match("^#{section}")
  end
  
  def is_current?(url)
    current_page.path == url
  end
  
  def list_nav_link(link_text, url, options = {})
    if is_current?(url)
      '<li id="current-node" class="current-nav">' + '<span class="label"><span id="current-icon">»</span>' + link_text + '</span></li>'
    else
      '<li>' + link_to(link_text, url, options) + '</li>'
    end
  end
  
  def title(sentence)
    sentence.capitalize.split(/[ _]/).join(" ")
  end

  def block(start_end = :start)
    if start_end == :end
      "</div>"
    elsif start_end.is_a? String
      "<div class=\"#{start_end}\">"
    else
      "<div>"
    end
  end

  def article(start_end = :start)
    if start_end == :end
      "</article>"
    elsif start_end.is_a? String
      "<article class=\"#{start_end}\">"
    else
      "<article>"
    end
  end
end

set :markdown_engine, :kramdown
activate :autoprefixer, browsers: ['last 2 versions', 'ie 8', 'ie 9']

set :relative_links, true
activate :relative_assets

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
end

activate :deploy do |deploy|
  deploy.method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch   = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end