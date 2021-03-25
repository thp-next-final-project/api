class MyPerformancesController < ApplicationController
  before_action :authenticate_user!

  def index
    @performances = MyPerformance.where(user_id: current_user.id)
    
    render json: @performances
  end

  def create
    HandleSavePerformances.new(current_user, params[:_json]).perform
  end
end
