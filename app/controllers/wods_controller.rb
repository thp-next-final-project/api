class WodsController < ApplicationController
  before_action :authenticate_user!

  def create
    @wod = GenWods.new(current_user).perform

    render json: { wod: @wod }
  end

  private

  def params_wod
   params.require(:wod).permit()
  end
end
