class FirebugController < ActionController::Base
  MIME_TYPES = {
    'js'    => 'text/javascript',
    'html'  => 'text/html',
    'css'   => 'text/css',
    'png'   => 'image/png',
    'gif'   => 'image/gif'
  }
  
  def assets
    filename = File.join(File.dirname(__FILE__), '..', 'assets', params[:filename].last)
    if !params[:filename].empty? && File.file?(filename)
      extname = File.extname(filename)
      type = extname ? MIME_TYPES[extname[1..-1]] : nil
      send_file filename, :type => type || :html, :stream => false, :disposition => 'inline'
    else
      render :file => "#{Rails.root}/public/404.html", :status => 404
    end
  end
  
end