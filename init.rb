if RAILS_ENV == 'development'
  require 'firebug_controller'
  require File.dirname(__FILE__) + '/routes'
end

require 'firebug_helper'
ActionView::Base.send :include, FirebugHelper

