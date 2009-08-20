module Firebug
  
  def self.show?(controller)
    return false if Options.show_if && !Options.show_if.call(controller)
    return false if Options.show_unless && Options.show_unless.call(controller)
    true
  end
  
  module Options
    mattr_accessor :show_if, :show_unless
  end
end