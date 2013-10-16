module ApplicationHelper

def logged_in_link?
  unless session[:user_id] == nil
    return link_to "Logout", logout_path, method: "DELETE"
  end
end


end
