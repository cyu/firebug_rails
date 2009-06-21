if RAILS_ENV == 'development'
  require 'firebug_controller'
  require File.dirname(__FILE__) + '/routes'
  
  require 'firebug_support'
  ActionController::Base.send :include, FirebugSupport
  ActionController::Base.send :after_filter, :add_firebug_code
end