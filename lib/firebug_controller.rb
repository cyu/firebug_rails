class FirebugController < ActionController::Base
  MIME_TYPES = {
    'js' => 'text/javascript',
    'html' => 'text/html',
    'png' => 'image/png',
    'css' => 'text/stylesheet'
  }
  
  def assets
    filename = File.join(File.dirname(__FILE__), '..', 'assets', params[:filename].last)
    if !params[:filename].empty? && File.file?(filename)
      type = MIME_TYPES[$1.downcase] if filename =~ /\.(\w+)$/
      type ||= 'text/html'
      send_file filename, :type => type, :stream => false, :disposition => 'inline'
    else
      render :file => RAILS_ROOT + '/public/404.html', :status => 404
    end
  end
  
end