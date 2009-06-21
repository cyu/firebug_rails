if RAILS_ENV == 'development'
  require 'firebug_controller'
  require File.dirname(__FILE__) + '/routes'
  ActionView::Helpers::AssetTagHelper.register_javascript_include_default('/firebug/firebug.js')
end