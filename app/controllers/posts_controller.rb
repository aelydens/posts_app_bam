class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(post_params.merge(user_id: @user.id))
    if @post.save
      flash[:notice] = "New post created"
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:category_id, :title, :content)
  end

end
