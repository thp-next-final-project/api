class WodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @wod = GenWods.new().perform

    render json: { wod: @wod, exercices: @wod.exercices }
  end

end
