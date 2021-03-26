class WodsController < ApplicationController
  before_action :authenticate_user!

  def create
    @wod = GenWods.new(current_user).perform
    # Wod.create(cal: GetWodCalories.new(current_user, @wod).perform)
    render json: { wod: @wod }
  end

  private

  def params_wod
   params.require(:wod).permit()
  end
end
