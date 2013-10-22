class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  def find_whateverable #general object search for all polymorphic belongings
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return name.gsub('_id', '').classify.constantize.find(value)
      end
    end
    nil
  end
end
