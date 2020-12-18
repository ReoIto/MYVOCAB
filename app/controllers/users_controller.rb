class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update,]}
  protect_from_forgery :except => [:create]

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
                     name: params[:name],
                     email: params[:email],
                     birthday: params[:birthday],
                     password: params[:password],
                     image_name: "default_user_image.gif"
                    )

    if @user.save
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "Your account has been created."
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

      if params[:image]
        @user.image_name = "#{@user.id}.jpg"
        image = params[:image]
        File.binwrite("public/user_images/#{@user.image_name}", image.read)
      end

      if @user.save
        redirect_to("/users/#{@user.id}")
        flash[:notice] = "Your account has been edited."
      else
        render("users/edit")
      end
  end

  def login_form

  end

  def login
    @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:notice] = "You've successfully logged in."
        redirect_to("/posts/index")
      else
        @error_message = "Email or password is incorrect."
        @email = params[:email]
        render("users/login_form")
      end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/login")
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "You don't have the authority to."
      redirect_to("/posts/index")
    end
  end

end
