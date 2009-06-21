module FirebugHelper
  def javascript_include_tag(*sources)
    if RAILS_ENV == 'development' && (sources.include?(:defaults) || sources.include?(:all))
      super(*(['/firebug/firebug.js'] + sources))
    else
      super(*sources)
    end
  end
end