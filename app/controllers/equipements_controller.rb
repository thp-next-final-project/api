class EquipementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @equipements = Equipement.where.not(id: current_user.equipements)
    render json: @equipements
  end

end