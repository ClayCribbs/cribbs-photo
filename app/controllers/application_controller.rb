class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :categories, :brands

  def brands
  	@brands = Product.pluck(:brand).sort.uniq!
  end

  def categories
  	@categories = Category.order(:name)
  end

protected

def configure_permitted_parameters

  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, 
     :password_confirmation, :role) }

  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, 
     :password_confirmation, :current_password, :role) }
end


end
