class PostsController < ApplicationController
  before_action :authenticate_user


  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @id = params[:id]
    @post = Post.find_by(id: params[:id] )
    @user = User.find_by(id: @post.user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
                    content: params[:content],
                    meaning: params[:meaning],
                    example: params[:example],
                    synonyms: params[:synonyms],
                    antonyms: params[:antonyms],
                    note: params[:note],
                    user_id: @current_user.id
                    )
    if @post.save
      flash[:notice] = "New list has been created."
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id] )
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content  = params[:content]
    @post.meaning  = params[:meaning]
    @post.example  = params[:example]
    @post.synonyms = params[:synonyms]
    @post.antonyms = params[:antonyms]
    @post.note     = params[:note]
    if @post.save
      flash[:notice] = "The list has been edited."
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "the list has been deleted."
    redirect_to("/posts/index")
  end
end
