class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
 before_filter do
  resource = controller_name.singularize.to_sym
  method = "#{resource}_params"
  params[resource] &&= send(method) if respond_to?(method, true)
end
  
  #force_ssl
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to service_obeharig_path, :alert => exception.message
  end
  
end
