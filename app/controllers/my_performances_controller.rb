class MyPerformancesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:id]
      @performances = MyPerformance.where(user_id: current_user.id, id: params[:id])
    else
      @performances = MyPerformance.where(user_id: current_user.id)
    end
    render json: @performances
  end

  def create
    HandleSavePerformances.new(current_user, params[:_json]).perform
  end
end
