class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_current_user, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def personal_index

  end

  def show
    @id = params[:id]
    @post = Post.find_by(id: params[:id] )
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
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

  def ensure_current_user
    @post = Post.find_by(id: params[:id])
      if @post.user_id != @current_user.id
        flash[:notice] = "You don't have the authority to."
        redirect_to("/posts/index")
      end
  end
end
