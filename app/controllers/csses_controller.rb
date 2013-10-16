class CssesController < ApplicationController
  before_action :set_css, only: [:show, :edit, :update, :destroy]

  # GET /csses
  # GET /csses.json
  def index
    @csses = Css.all
  end
  
   def main
    @csses = Css.all
    
   
     @header=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("header")
     @content=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("contentcolumn")
     @right=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("rightcolumn")
     @left=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("leftcolumn")
     @footer=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("footer")
     @wraper=Section.where("site_id ='" +params[:site_id]+ "'").find_by_name("wraper")
     @site=params[:site_id]
  end


  # GET /csses/1
  # GET /csses/1.json
  def show
    @css = Css.find(params[:id])
  respond_to do |format|
    format.html
    format.css
  end
  end

  # GET /csses/new
  def new
    @css = Css.new
  end

  # GET /csses/1/edit
  def edit
  end

  # POST /csses
  # POST /csses.json
  def create
    @css = Css.new(css_params)

    respond_to do |format|
      if @css.save
        format.html { redirect_to @css, notice: 'Css was successfully created.' }
        format.json { render action: 'show', status: :created, location: @css }
      else
        format.html { render action: 'new' }
        format.json { render json: @css.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /csses/1
  # PATCH/PUT /csses/1.json
  def update
    respond_to do |format|
      if @css.update(css_params)
        format.html { redirect_to @css, notice: 'Css was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @css.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /csses/1
  # DELETE /csses/1.json
  def destroy
    @css.destroy
    respond_to do |format|
      format.html { redirect_to csses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_css
      @css = Css.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def css_params
      params.require(:css).permit(:color, :background, :width, :height)
    end
end
