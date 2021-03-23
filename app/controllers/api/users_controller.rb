class Api::UsersController < Api::BaseController

  before_action :find_user, only: %w[show]

  def show
    render_jsonapi_response(@user)
  end

  def update
    if current_user.update(user_params)
      render json: current_user
    else
      render json: current_user.errors.full_messages, status: :unprocessable_entity
    end

  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email)
  end


end
