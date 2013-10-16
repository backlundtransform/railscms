class ServiceController < ApplicationController
  def index
    if user_signed_in?
      @admin_user = User.find(current_user)
      redirect_to admin_user_sites_path(@admin_user)
    end
  end
  
  def obeharig
    
  end
end
