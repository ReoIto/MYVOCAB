class UsersController < ApplicationController

  protect_from_forgery :except => [:create]

  def show
    @user = User.find_by(id: params[:id])
  end

  def new

    @user = User.new

  end

  def create
    @user = User.new(name: params[:name], email: params[:email], birthday: params[:birthday])

    if @user.save
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "Your account has been created."
    else
      render("users/new")
    end
  end

end
