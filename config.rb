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
  def is_dev()
    development? || ENV['BUILD_FOR_GITHUB']
  end

  def w3url(uri)
    if is_dev()
      'https://www.w3.org' + uri.to_s
    else
      uri
    end
  end

  def is_current?(url)
    current_page.url == url
  end
  
  def title(sentence)
    sentence.capitalize.split(/[ _-]/).join(" ")
  end

  def expand_collapse(start_end = :start)
    if start_end == :start
      '<div class="f_controls_accordion f_fileToLoad_accordionControls"></div>
<div id="accordion" class="accordionWrapper">'
    elsif start_end == :end
      '</div></div>'
    end
  end
    
  def read_more(start_end = :start)
    if start_end == :end
      '</div>'
    elsif start_end == :start
      '<span class="f_panelHead">Read more.</span><div>'
    elsif start_end.is_a? String
      "<span class=\"f_panelHead\">Read more about #{start_end}.</span><div>"
    end
  end

  def support(start_end = :start)
    if start_end == :start
      '<div class="support-material">'
    elsif start_end == :end
      '</div>'
    end
  end

  def more_information(start_end = :start)
    if start_end == :start
      '<aside class="more-information"><h3>For more information</h3>'
    elsif start_end == :end
      '</aside>'
    end
  end

  def related(start_end = :start)
    if start_end == :start
      '<aside class="related"><h3>Related activities</h3>'
    elsif start_end == :end
      '</aside>'
    end
  end

  def activity(start_end = :start)
    if start_end == :end
      "</div></article>"
    elsif start_end.is_a? String
      "<article class=\"#{start_end}\"><div class=\"f_panelHead\">"
    else
      "<article><div class=\"f_panelHead\">"
    end
  end
  
  def activity_body()
    '</div><div>'
  end

  def list_icon(icon)
    content_tag(:i, nil, {:class => "fa fa-fw fa-li fa-#{icon}"})
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