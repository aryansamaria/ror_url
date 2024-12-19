class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def login(user)
    session[:user_id] = user.id 
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    session[:user_id].present?
  end

  

  def prevent_unauthorized_user_access
    unless logged_in?
      redirect_to root_path, notice: 'sorry, you cannot access that page', status: :found
    end 
  end

  def prevent_logged_in_user_access
    if logged_in?
      redirect_to root_path, notice: 'You are already logged in.', status: :found
    end
  end

end
