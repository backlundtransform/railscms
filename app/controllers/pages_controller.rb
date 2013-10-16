class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :load_page, only: [:create]
  
  load_and_authorize_resource

  # GET /pages
  # GET /pages.json
  def index
    @mother_site = Site.find(params[:site_id])
    @pages = @mother_site.pages
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @site = Site.find(params[:site_id])
    @page_url = site_pages_path(@site)
    @page = Page.new
    @page.site_id = params[:site_id]
    
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @section_1 = Section.new
    @section_1.name = "top"
    @section_1.page_id = 
    
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page }
      else
        format.html { render action: 'new' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html {
         redirect_to @page, notice: 'Page was successfully updated.' 
         }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @the_site = @page.site
    @page.destroy
    respond_to do |format|
      format.html { redirect_to site_pages_url(@the_site) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
      
      #@page.pages_path = @page.site_pages_path
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :meta_description, :site_id)
    end
    
    
    def load_page
      @page = Page.new(page_params)
    end
end
