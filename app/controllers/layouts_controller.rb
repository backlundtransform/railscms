class LayoutsController < ApplicationController
  load_and_authorize_resource
  before_action :set_layout, only: [:show, :edit, :update, :destroy]

  # GET /layouts
  # GET /layouts.json
  def index
    @layouts = Layout.all
     
     respond_to do |format|
      format.html
    format.js
    end
 
  end
  
  

  # GET /layouts/1
  # GET /layouts/1.json
  def show
             @title=params[:id]
      @layout = Layout.find_by_title(@title)
  respond_to do |format|
      format.html
     format.css
      format.js
    end

  end

  # GET /layouts/new
  def new
    @layout = Layout.new
  end

  # GET /layouts/1/edit
  def edit
     @layout = Layout.find(params[:id])
  end

  # POST /layouts
  # POST /layouts.json
  def create

    @layout = Layout.new(layout_params)
    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
 
  @layout.save


  end

  def update
       @why =layout_params
          @layout = Layout.find(params[:id])
       @layout.update(layout_params)
    respond_to do |format|
      format.html 
      format.js {}
      format.json { head :no_content }
    end


  end

  # DELETE /layouts/1
  # DELETE /layouts/1.json
  def destroy
    @layout.destroy
    respond_to do |format|
      format.html { redirect_to layouts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_layout

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def layout_params
      params.require(:layout).permit(:title, :content, :checked)
    end
end
