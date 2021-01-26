class ApplicationController < ActionController::Base

  # before_action :set_current_user

  before_action :set_search

  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_search
    @search = Post.ransack(params[:q])
    @searched_posts = @search.result.order(created_at: :desc)
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  # def
  #   if @current_user == nil
  #     flash[:notice] = "Please login to your account."
  #     redirect_to("/login")
  #   end
  # end

  def forbid_login_user
    if @current_user
      flash[:notice] = "Your account is already logged in."
      redirect_to("/posts/index")
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
