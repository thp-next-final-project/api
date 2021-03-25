class MyEquipementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @equipements = User.find(current_user.id).equipements
    render json: @equipements
  end

  def update
    MyEquipement.create(user_id: current_user.id, equipement_id: params[:id])
  end

  def destroy
    MyEquipement.where(user_id: current_user.id, equipement_id: params[:id]).destroy
  end

  private
  def set_equipement
    @equipement = Equipement.find(params[:id])
  end

  def my_equipement_params
    params.require(:my_equipement).permit(:equipement_id)
  end
end