class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]
  before_action :load_site, only: [:create]
  
  load_and_authorize_resource
  
  # GET /sites
  # GET /sites.json
  def index
    ##IF NOT ADMIN
    @user = User.find(current_user)
    @sites = @user.sites
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
  end

  # GET /sites/new
  def new
    @user = User.find(params[:admin_user_id])
    @site_url = admin_user_sites_path(@user)
    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  # POST /sites.json
  def create
    respond_to do |format|
      if @site.save
        format.html { redirect_to admin_user_path(@site.user), notice: 'Site was successfully created.' }
        
        
     Site.seedsec(@site.id)
      else
        format.html { redirect_to admin_user_path(@site.user) }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @user = @site.user
    @site.destroy
    respond_to do |format|
      format.html { redirect_to admin_user_sites_url(@user) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:title)
    end
    
    def load_site
      @user = User.find(params[:admin_user_id])
      @site = @user.sites.build(site_params)
    end
end
