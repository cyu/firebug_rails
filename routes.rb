module ActionController
  module Routing #:nodoc:
    class RouteSet #:nodoc:
      def draw_with_firebug_routes
        draw_without_firebug_routes do |map|
          map.connect 'firebug/*filename', :controller => 'firebug', :action => 'assets'
          yield map
        end
      end
      alias_method_chain :draw, :firebug_routes
    end
  end
end
