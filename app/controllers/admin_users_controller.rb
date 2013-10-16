class AdminUsersController < ApplicationController
  ##CANCAN load function does not work here due to the controller name
  ##rails4 shit::::
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  
  def index
    @admin_users = User.order(:email)
    authorize! :read, @admin_users
  end

  def show
    
    authorize! :read, @admin_user
  end

  def new
    @admin_user = User.new
    authorize! :new, @admin_user
  end
  
  def edit
    #@url = update_admin_user_path(@admin_user)
    authorize! :edit, @admin_user
  end

  def create
    @admin_user = User.new(user_params)
    @admin_user.password = "roar1337"
    
    authorize! :create, @admin_user
    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to admin_users_url(@admin_user), notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
    
  end

  def update
    authorize! :update, @admin_user
    respond_to do |format|
      if @admin_user.update(user_params)
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.'+@admin_user.role.to_s }
      else
        format.html { render action: "new" }
      end
    end
    
    
  end



  def delete
    authorize! :destroy, @admin_user
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end
  def destroy
    authorize! :destroy, @admin_user
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end
  
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :role)
    end
end
