module FirebugSupport
    def add_firebug_code
      firebug_code = <<-HTML
        <link href="/firebug/firebug-lite.css"  media="screen" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="/firebug/firebug-lite.js"></script>
  HTML
      response.body.gsub! '</head>', firebug_code + '</head>' if response.body.respond_to?(:gsub!)
    end
end