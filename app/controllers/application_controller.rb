class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique

  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end

  def record_not_unique(message)
    render json: {
      'errors': [
        {
          'status': '400',
          'title': message
        }
      ]
    }, status: 400
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :age, :role, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :age, :email, :password])
  end

end
