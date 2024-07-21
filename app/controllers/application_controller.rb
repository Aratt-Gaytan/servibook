class ApplicationController < ActionController::Base
  config.force_ssl = true
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_query
  protected

  def set_query
    @query = Book.ransack(params[:q])
    @authors = Author.all  # Optionally, fetch all genres for the dropdown menu
    @genres = Genre.all  # Optionally, fetch all genres for the dropdown menu



  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone , :address])
  end
  def check_user_role
    unless current_user.role_id == 1 || 3
      render file: "#{Rails.root}/public/422.html", status: :unprocessable_entity
    end
  end
end
