class SectionsController < ApplicationController
  layout "csscontroll"
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  # load_and_authorize_resource

 

  # GET /sections
  # GET /sections.json
  def index   
    @sections = Section.where("site_id ='" +params[:site_id]+ "'").find_all_by_checked(true)
    @layouts = Layout.all
    @header=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("header")
    @content=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("contentcolumn")
    @right=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("rightcolumn")
    @left=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("leftcolumn")
    @footer=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("footer")
    @wraper=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("wraper")
    @site=params[:site_id]
     
     
  end

  # GET /sections/1
  # GET /sections/1.json
  
  
  def main
     @sections = Section.where("site_id ='" +params[:site_id]+ "'").find_all_by_checked(true)
     @header=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("header")
     @content=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("contentcolumn")
     @right=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("rightcolumn")
     @left=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("leftcolumn")
     @footer=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("footer")
     @wraper=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("wraper")
     @site=params[:site_id]
  end

  def show
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        format.json { render action: 'show', status: :created, location: @section }
      else
        format.html { render action: 'new' }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        #format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:name, :content, :checked)
    end
end
