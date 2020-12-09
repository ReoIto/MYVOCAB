class UsersController < ApplicationController

  protect_from_forgery :except => [:create]

  def show
    @user = User.find_by(id: params[:id])
  end

  def new

    @user = User.new

  end

  def create
    @user = User.new(name: params[:name],
                     email: params[:email],
                     birthday: params[:birthday],
                     image_name: params[:image]
                    )

    if params[:image]
      @user.image_name = "#{@user.name}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

      if @user.save
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

end
