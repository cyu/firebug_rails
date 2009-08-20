if RAILS_ENV == 'development'
  require 'firebug_controller'
  require File.dirname(__FILE__) + '/routes'
  
  ActionController::Base.send(:after_filter, Proc.new { |controller|
    if !defined?(Firebug::Options) || Firebug.show?(controller)
      firebug_code = <<-HTML
        <script type="text/javascript" src="/firebug/firebug-lite.js"></script>
        <script type="text/javascript">firebug.env.css = "/firebug/firebug-lite.css"</script>
  HTML
      body = controller.response.body
      body.gsub!('</body>', firebug_code + "</body>") if body.respond_to?(:gsub!)
    end
  })
end