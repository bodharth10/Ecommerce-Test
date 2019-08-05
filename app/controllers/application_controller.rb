class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_order
  def current_order
    if !session[:order_id].nil?
      order = Order.find_by(id: session[:order_id])
      Order.new unless order.present?
      return order
    else
      Order.new
    end
  end

  def admin_user
    return if user_signed_in? && current_user.admin?

    flash[:info] = "Not Authorized for this action!!!"
    redirect_back(fallback_location: root_url)
  end

  protected

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :country_code, :phone_number)}

     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :country_code, :phone_number)}
  end

end
