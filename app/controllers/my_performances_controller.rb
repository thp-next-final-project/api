class MyPerformancesController < ApplicationController
  before_action :authenticate_user!

  def index
    @performances = MyPerformance.where(user_id: current_user)
    
    render json: @performances
  end

end
