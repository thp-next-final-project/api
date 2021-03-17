class MyObjectivesController < ApplicationController
  def index
    @my_objectives = MyObjectif.all
    
        render json: @my_objectives
  end

  def show
    set_my_objectives
        render json: { my_objectif: @my_objectif}
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_my_objectives
    @my_objectif = MyObjectif.find(params[:id])
  end
end
