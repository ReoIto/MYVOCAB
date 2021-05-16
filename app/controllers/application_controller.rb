class ApplicationController < ActionController::Base

  # before_action :set_current_user
  before_action :set_search
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, {only: [:index, :show, :edit, :update]}

  def set_search
    @search = Post.ransack(params[:q])
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  # def authenticate_user
  #  if @current_user == nil
  #    flash[:notice] = "Please login to your account."
  #    redirect_to("/login")
  #  end
  # end

  def forbid_login_user
    if current_user
      flash[:notice] = "Your account is already logged in."
      redirect_to("/posts/index")
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    top_path
  end

  protected

  # def configure_permitted_parameters
  #   added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
  #   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #   devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
  #   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  # end

end
